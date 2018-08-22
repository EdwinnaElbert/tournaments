class SurveyQuestionAnswer < ApplicationRecord
  belongs_to :survey_question

  has_many :survey_user_answers

  validates_presence_of :answer, :weight
end
