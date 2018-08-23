# frozen_string_literal: true

class SurveyQuestionAnswer < ApplicationRecord
  belongs_to :survey_question

  has_many :survey_user_answers

  validates :answer, :weight, presence: :true
end
