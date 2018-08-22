# frozen_string_literal: true

FactoryBot.define do
  factory :anonymous_survey do
    title { Faker::Company.name }
    description { Faker::Matz.quote }
    is_anonymous true
    start_datetime Date.today
    end_datetime Date.today + 1.month
  end

  factory :survey do
    title { Faker::Company.name }
    description { Faker::Matz.quote }
    is_anonymous false
    start_datetime Date.today
    end_datetime Date.today + 1.month
  end
end
