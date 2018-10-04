# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :group

  has_many :scores
  has_many :teams, through: :scores
end
