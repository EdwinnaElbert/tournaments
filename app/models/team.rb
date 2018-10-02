# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :tournament
  belongs_to :group, required: false
  has_and_belongs_to_many :teams

  has_many :scores
  has_many :matches, through: :scores

  validates :title, presence: :true
  validates :off, inclusion: { in: [true, false], message: "Off should be set to true or false" }
end
