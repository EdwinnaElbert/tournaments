# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :tournament

  has_many :matches
  has_many :scores, through: :matches

  validates :title, presence: :true
  validates :off, inclusion: { in: [true, false], message: "Off should be set to true or false" }
end
