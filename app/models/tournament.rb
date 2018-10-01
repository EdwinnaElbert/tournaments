# frozen_string_literal: true

class Tournament < ApplicationRecord
  include AASM

  has_many :teams, dependent: :destroy
  has_many :groups
  has_many :matches, through: :teams

  accepts_nested_attributes_for :teams, reject_if: proc { |attributes| attributes.values.include?(nil) }, allow_destroy: false, limit: 16
  validates :title, presence: :true
  validate :team_count, :team_uniq

  # scope :group, (game_type)->{ |game_type| true }

  aasm do
    state :no_games, initial: true
    state :first_tour
    state :play_off_1_4
    state :play_off_1_2
    state :final
    event :to_next_state do
      transitions from: :play_off_1_2, to: :final
      transitions from: :play_off_1_4, to: :play_off_1_2
      transitions from: :first_tour, to: :play_off_1_4
      transitions from: :no_games, to: :first_tour
    end
  end

  def team_count
    errors.add(:tournament, "Should have 16 teams involved") if teams.length != 16
  end

  def team_uniq
    errors.add(:tournament, "All 16 teams should have uniq names") if teams.pluck(:title).uniq.count != teams.pluck(:title).count
  end
end
