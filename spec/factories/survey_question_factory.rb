# frozen_string_literal: true

FactoryBot.define do
  factory :survey_question do
    question { "Name smth" }
    weight   { Faker::Number.number(1) }
    question_type { Faker::Number.between(0, 2) }
    survey
  end
end
