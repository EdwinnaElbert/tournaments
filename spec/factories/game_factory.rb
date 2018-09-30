# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    game_type { Faker::Number.within(1..400) }
    association :tournament
    team_1_id SecureRandom.uuid
    score_1 { Faker::Number.within(1..400) }
    team_2_id SecureRandom.uuid
    score_2 { Faker::Number.within(1..400) }
    judge_decision_win false
  end
end
