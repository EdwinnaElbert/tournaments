# frozen_string_literal: true

class WinnersLoosersFirstService

  def self.call(tournament, group_id, loosers = [], winners_scores = [])
    scores = ScoresService.call(group_id)
    team_total_scores = scores.flatten.map { |s| [s.team_id, s.score] }.group_by { |t| t[0] }.map { |t| [t[1].map { |tt| tt[1] }.flatten.sum, t[0]] }.sort!
    loosers << team_total_scores.slice(0..((team_total_scores.count / 2) - 1))
    winners_scores << team_total_scores.slice((team_total_scores.count / 2)..(team_total_scores.count - 1))
    [winners_scores, loosers]
  end
end
