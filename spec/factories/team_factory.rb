# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    title { Faker::Alphanumeric.alphanumeric(20) }
    association :tournament, :with_many_teams
    off false
    association :group
  end
end
