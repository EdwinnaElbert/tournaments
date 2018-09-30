# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    title { Faker::Alphanumeric.alphanumeric(10) }
    association :tournament
    off false
  end
end
