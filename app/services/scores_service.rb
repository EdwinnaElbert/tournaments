# frozen_string_literal: true

class ScoresService
  def self.call(group_id, scores = [])
    matches = Match.where("group_id in (?)", group_id).includes(scores: :team)
    matches.each do |match|
      scores << match.scores.order(score: :desc)
    end
    scores
  end
end
