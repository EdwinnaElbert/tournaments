# frozen_string_literal: true

class WinnersLosersPlayOffService
  def self.call(tournament, group_id, losers = [], winners_scores = [])
    scores = ScoresService.call(group_id)
    winners = scores.map { |s| s[0] }.pluck(:score, :team_id)
    losers = scores.map { |s| s[1] }.pluck(:team_id)
    [winners, losers]
  end
end
