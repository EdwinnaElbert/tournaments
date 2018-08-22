# frozen_string_literal: true

class Survey < ApplicationRecord
  belongs_to :user

  has_many :survey_questions
  has_many :survey_user_answers

  validates_presence_of :title, :start_datetime, :user_id
end
