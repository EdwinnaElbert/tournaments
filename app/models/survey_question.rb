# frozen_string_literal: true

class SurveyQuestion < ApplicationRecord
  has_many :survey_question_answers
  has_many :survey_user_answers

  belongs_to :survey

  accepts_nested_attributes_for :survey_question_answers, reject_if: :all_blank, allow_destroy: true
  validates :question, :weight, presence: :true

  # enum question_type: %i[zero radio checkbox string] # :survey_id
end
