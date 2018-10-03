# frozen_string_literal: true

class DivideWinnersLoosersService
  def self.call(tournament, group_id)
    tournament = tournament
    loosers = []
    winners_scores = []

    scores = Score.where("team_id in (?)", tournament.teams.where(group_id: group_id).pluck(:id))
    team_total_scores = scores.map { |s| [s.team_id, s.score] }.group_by { |t| t[0] }.map{ |t| [t[1].map {|tt| tt[1]}.flatten.sum, t[0]] }.sort!
    loosers << team_total_scores(group_id).slice(0..3)
    winners_scores << team_total_scores(group_id).slice(4..7)

    [loosers, winners_scores]
  end
end
