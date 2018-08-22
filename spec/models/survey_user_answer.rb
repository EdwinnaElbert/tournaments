# frozen_string_literal: true

require "rails_helper"

RSpec.describe SurveyUserAnswer, type: :model do
  let!(:user) { FactoryBot.create :user }
  let!(:survey) { FactoryBot.create :survey, user: user, is_anonymous: true }
  let!(:survey_question) { FactoryBot.create :survey_question, survey: survey }
  let!(:survey_question_answer) { FactoryBot.create :survey_question_answer, survey_question: survey_question }
  let!(:survey_user_answer) { FactoryBot.create :survey_user_answer, survey_question: survey_question, survey: survey, user: user, survey_question_answer_ids: [survey_question.id] }

  # FactoryBot.create :survey_user_answer, survey_question_id: surv_quest.id, survey: survey, user_id: us.id
  describe "Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:survey) }
    it { is_expected.to belong_to(:survey_question) }
    it { is_expected.to belong_to(:survey_question_answer) }
  end
end

# validates_presence_of :user_id, :survey_id, :survey_question_id
