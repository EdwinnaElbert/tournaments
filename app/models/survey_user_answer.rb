# frozen_string_literal: true

class SurveyUserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  belongs_to :survey_question
  belongs_to :survey_question_answer, optional: true

  validates :user_id, :survey_question_id, presence: :true
end
