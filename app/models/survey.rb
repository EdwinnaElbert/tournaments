# frozen_string_literal: true

class Survey < ApplicationRecord
  belongs_to :user

  has_many :survey_questions
  has_many :survey_user_answers

  validates :title, :start_datetime, :user_id, presence: :true
  validates :is_anonymous, inclusion: { in: [true, false], message: "Anonymous should be set to true or false" }
end
