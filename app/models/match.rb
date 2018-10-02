# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :group

  has_and_belongs_to_many :matches
  has_many :scores
  has_many :teams, through: :scores
end
