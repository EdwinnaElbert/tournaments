# frozen_string_literal: true

class Tournament < ApplicationRecord
  include AASM

  has_and_belongs_to_many :teams
  has_many :groups, -> { order(group_type: :asc) }

  accepts_nested_attributes_for :teams, reject_if: proc { |attributes| attributes.values.include?(nil) }, allow_destroy: false, limit: 16
  validates :title, presence: :true
  validate :team

  aasm do
    state :no_games, initial: true
    state :first_tour
    state :play_off_1_4
    state :play_off_1_2
    state :final
    state :finished
    event :to_next_state do
      transitions from: :final, to: :finished, after: Proc.new {  }
      transitions from: :play_off_1_2, to: :final, after: Proc.new { PlayOffService.new.call(self) }
      transitions from: :play_off_1_4, to: :play_off_1_2, after: Proc.new { PlayOffService.new.call(self) }
      transitions from: :first_tour, to: :play_off_1_4, after: Proc.new { PlayOffService.new.call(self) }
      transitions from: :no_games, to: :first_tour, after: Proc.new { FirstTourService.new.call(self) }
    end
  end

  def team
    errors.add(:tournament, "Should have 16 teams involved") if teams.length != 16
    errors.add(:tournament, "All 16 teams should have uniq names") if teams.pluck(:title).uniq.count != teams.pluck(:title).count
  end

  # def group_teams(group_type)
  #   teams.where("group_id = ?", group_type)
  # end

  def current_groups
    aasm_state.in?(["no_games", "first_tour"]) ? groups.limit(2).pluck(:id) : [groups[aasm_state.to_i].id]
  end
end
