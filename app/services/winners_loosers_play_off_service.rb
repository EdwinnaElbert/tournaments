# frozen_string_literal: true

class WinnersLoosersPlayOffService
  def self.call(tournament, group_id, loosers = [], winners_scores = [])
    scores = ScoresService.call(group_id)
    winners = scores.map { |s| s[0] }.pluck(:score, :team_id)
    loosers = scores.map { |s| s[1] }.pluck(:team_id)
    [winners, loosers]
  end
end
