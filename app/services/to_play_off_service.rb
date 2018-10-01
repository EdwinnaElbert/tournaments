# frozen_string_literal: true

# this class takes total score for teams in each group and sorts them by score ASC
# then for each group it splits scores into two parts,

class ToPlayOffService
  def self.call(tournament)
    @tournament = tournament
    winners = []
    [0, 1].each do |group_type|
      team_total_scores = total_scores(group_type)
      set_off(team_total_scores.slice(0..3))
      winners << team_total_scores.slice(4..7)
    end
    CreatePlayOffMatchesService.call(winners)
  end

  def total_scores(group_type)
    scores = Score.where("team_id in (?)", @tournament.group_teams(group_type).pluck(:id))
    scores.map { |s| [s.team_id, s.score] }.group_by { |t| t[0] }.map{ |t| [t[1].map {|tt| tt[1]}.flatten.sum, t[0]] }.sort!
  end

  def set_off(teams)
    team_ids = teams.map { |t| t[1] }
    Team.find(team_ids).update_all(off: true)
  end
end
