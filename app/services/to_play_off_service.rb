# frozen_string_literal: true

# this class takes total score for teams in each group and sorts them by score ASC
# then for each group it splits scores into two parts,

class ToPlayOffService
  def self.call(tournament)
    binding.pry
    @tournament = tournament
    winners = []
    [0, 1].each do |group_type|
      team_total_scores = TotalScoresService.call(tournament, group_type)
      SetOffService.call(tournament, eam_total_scores.slice(0..3))
      winners << team_total_scores.slice(4..7)
    end
    CreatePlayOffMatchesService.call(winners)
  end

  def set_off(teams)
    team_ids = teams.map { |t| t[1] }
    Team.find(team_ids).update_all(off: true)
  end
end
