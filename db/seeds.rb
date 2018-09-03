# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: Faker::Name.first_name,
             last_name: Faker::Name.last_name,
             email: "surveys1@test.com",
             phone: "79781234567",
             password: "surveys1",
             confirmed_at: Time.now)
Survey.create!(title: Faker::Company.name,
               description: Faker::Matz.quote,
               is_anonymous: true,
               start_datetime: Date.today,
               end_datetime: Date.today + 1.month,
               user_id: User.first.id)
SurveyQuestion.create!(question: "Name smth",
                       weight: Faker::Number.number(1),
                       question_type: Faker::Number.between(0, 2),
                       survey_id: Survey.first.id)
SurveyQuestionAnswer.create!(answer: Faker::ElderScrolls.creature,
                             weight: Faker::Number.number(1),
                             survey_question_id: SurveyQuestion.first.id)
SurveyUserAnswer.create!(answer: "#{Faker::ElderScrolls.first_name} #{Faker::ElderScrolls.last_name}",
                         weight: Faker::Number.number(1),
                         survey_question_answer_ids: [SurveyQuestionAnswer.first.id],
                         survey_question_answer_id: SurveyQuestionAnswer.first.id,
                         survey_question_id: SurveyQuestion.first.id,
                         survey_id: Survey.first.id,
                         user_id: User.first.id)
