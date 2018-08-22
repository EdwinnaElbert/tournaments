# frozen_string_literal: true

require "rails_helper"

RSpec.describe SurveyQuestion, type: :model do
  let!(:user) { FactoryBot.create :user }
  let!(:survey) { FactoryBot.create :survey, user_id: user.id, is_anonymous: true }
  let!(:survey_question) { FactoryBot.create :survey_question, survey_id: survey.id }
  # let!(:survey_question_answer) { FactoryBot.create :survey_question_answer, survey_question_id: survey_question.id }
  # let!(:survey_user_answer) { FactoryBot.create :survey_user_answer, survey_question_id: survey_question.id, user_id: user.id, survey_question_answer_ids: [survey_question_answer.id] }

  describe "Associations" do
    it { is_expected.to belong_to(:survey) }
    it { is_expected.to have_many(:survey_user_answers) }
    it { is_expected.to have_many(:survey_question_answers) }
  end

  describe "Validations" do
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:survey_id) }
    it { should validate_presence_of(:weight) }
  end
end
