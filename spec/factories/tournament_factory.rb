# frozen_string_literal: true

FactoryBot.define do
  factory :tournament do
    title { Faker::Alphanumeric.alphanumeric(10) }
    active true
    aasm_state "no_games"
    min_score { Faker::Number.within(1..400) }
    max_score { Faker::Number.within(1..400) }

    teams_attributes { [FactoryBot.attributes_for(:team)] }

    trait :with_many_teams do
      teams_attributes { [
        FactoryBot.attributes_for(:team), FactoryBot.attributes_for(:team),
        FactoryBot.attributes_for(:team), FactoryBot.attributes_for(:team),
        FactoryBot.attributes_for(:team), FactoryBot.attributes_for(:team),
        FactoryBot.attributes_for(:team), FactoryBot.attributes_for(:team),

        FactoryBot.attributes_for(:team), FactoryBot.attributes_for(:team),
        FactoryBot.attributes_for(:team), FactoryBot.attributes_for(:team),
        FactoryBot.attributes_for(:team), FactoryBot.attributes_for(:team),
        FactoryBot.attributes_for(:team), FactoryBot.attributes_for(:team)
      ] }
    end
  end
end
