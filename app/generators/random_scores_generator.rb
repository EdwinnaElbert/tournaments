# frozen_string_literal: true

class RandomScoresGenerator
  def self.call(tournament)
    matches = Match.where("group_id IN (?)", tournament.current_groups).includes([scores: :team])
    matches.each do |m|
      m.scores.each { |score| score.update_attributes(score: rand(tournament.min_score..tournament.max_score)) }
    end
  end
end
