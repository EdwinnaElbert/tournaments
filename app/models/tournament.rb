# frozen_string_literal: true

class Tournament < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :games, through: :teams

  accepts_nested_attributes_for :teams, reject_if: proc { |attributes| attributes.values.include?(nil) }, allow_destroy: false, limit: 16
  validates :title, presence: :true
  validate :team_count, :team_uniq

  # scope :group, (game_type)->{ |game_type| true }
  def team_count
    errors.add(:tournament, "Should have 16 teams involved") if teams.length != 16
  end

  def team_uniq
    errors.add(:tournament, "All 16 teams should have uniq names") if teams.pluck(:title).uniq.count != teams.pluck(:title).count
  end
end
