# frozen_string_literal: true

class SurveyUserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :survey, optional: true
  belongs_to :survey_question, optional: true
  belongs_to :survey_question_answer, optional: true

  validates :user_id, :survey_question_id, presence: :true
end
