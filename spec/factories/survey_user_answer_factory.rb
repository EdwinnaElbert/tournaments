# frozen_string_literal: true

FactoryBot.define do
  factory :survey_user_answer do
    answer { "#{Faker::ElderScrolls.first_name} #{Faker::ElderScrolls.last_name}" }
    weight { Faker::Number.number(1) }
    survey
    user
    survey_question
    survey_question_answer
  end
end
