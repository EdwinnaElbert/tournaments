# frozen_string_literal: true

FactoryBot.define do
  factory :survey_question_answer do
    answer { Faker::ElderScrolls.creature }
    weight { Faker::Number.number(1) }
    survey_question
  end
end
