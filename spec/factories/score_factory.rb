# frozen_string_literal: true

FactoryBot.define do
  factory :score do
    association :team
    association :match
    score { Faker::Number.within(1..400) }
  end
end
