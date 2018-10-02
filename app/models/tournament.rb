# frozen_string_literal: true

class Tournament < ApplicationRecord
  include AASM

  has_many :teams, dependent: :destroy
  has_many :groups
  has_many :home_matches, through: :teams, foreign_key: :team_1_id
  has_many :visitor_matches, through: :teams, foreign_key: :team_2_id
  accepts_nested_attributes_for :teams, reject_if: proc { |attributes| attributes.values.include?(nil) }, allow_destroy: false, limit: 16
  validates :title, presence: :true
  validate :team_count, :team_uniq

  aasm do
    state :no_games, initial: true
    state :first_tour
    state :play_off_1_4
    state :play_off_1_2
    state :final
    event :to_next_state do
      transitions from: :play_off_1_2, to: :final #,        after: Proc.new { |*args| set_process(*args) }
      transitions from: :play_off_1_4, to: :play_off_1_2 #, after: Proc.new { |*args| set_process(*args) }
      transitions from: :first_tour, to: :play_off_1_4 #,   after: Proc.new { |*args| set_process(*args) }
      transitions from: :no_games, to: :first_tour, after: Proc.new { current_groups([0, 1]); CreateFirstMatchesService.call(self) }
    end
  end

  def team_count
    errors.add(:tournament, "Should have 16 teams involved") if teams.length != 16
  end

  def team_uniq
    errors.add(:tournament, "All 16 teams should have uniq names") if teams.pluck(:title).uniq.count != teams.pluck(:title).count
  end

  def group_teams(group_type)
    teams.where('current_group_type = ?', group_type)
  end

  def current_groups(group_types = [])
    groups.where(group_type: group_types)
  end
end
