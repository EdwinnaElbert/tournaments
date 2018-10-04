# frozen_string_literal: true

class Team < ApplicationRecord
  has_and_belongs_to_many :tournaments
  belongs_to :group, required: false

  has_many :scores
  has_many :matches, through: :scores

  has_many :tournaments

  validates :title, presence: :true
  validates :off, inclusion: { in: [true, false], message: "Off should be set to true or false" }
end
