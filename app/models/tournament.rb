# frozen_string_literal: true

class Tournament < ApplicationRecord
  include AASM

  has_and_belongs_to_many :teams
  has_many :groups, -> { order(group_type: :asc) }

  accepts_nested_attributes_for :teams, reject_if: proc { |attributes| attributes.values.include?(nil) }, allow_destroy: false, limit: 16
  validates :title, presence: :true
  validate :team

  belongs_to :winner, class_name: "Team", required: false

  TOURNAMENT_STATES = [:no_games, :first_tour, :play_off_1_4, :play_off_1_2, :final, :finished]

  aasm do
    TOURNAMENT_STATES.each_with_index do |state, i|
      if i == 0
        state state, initial: true
      else
        state state
      end
    end
    event :to_next_state do
      transitions from: :final, to: :finished,            after: Proc.new { FinishTournamentService.new.call(self) }
      transitions from: :play_off_1_2, to: :final,        after: Proc.new { PlayOffService.new.call(self);  }
      transitions from: :play_off_1_4, to: :play_off_1_2, after: Proc.new { PlayOffService.new.call(self);  }
      transitions from: :first_tour, to: :play_off_1_4,   after: Proc.new { PlayOffService.new.call(self) }
      transitions from: :no_games, to: :first_tour,       after: Proc.new { FirstTourService.new.call(self) }
    end
  end

  def team
    errors.add(:tournament, "Should have 16 teams involved") if teams.length != 16
    errors.add(:tournament, "All 16 teams should have uniq names") if teams.pluck(:title).uniq.count != teams.pluck(:title).count
  end

  def current_groups
    aasm_state.in?(["no_games", "first_tour"]) ? groups.limit(2).pluck(:id) : [groups[TOURNAMENT_STATES.index(aasm_state.to_sym)].id]
  end

  def next_group_id
    groups.where("id > ?", current_groups.last).first.id || groups.last.id
  end

  def has_nil_scores?
    Match.where("group_id IN (?)", current_groups).includes([scores: :team]).where(scores: { score: nil }).any?
  end
end
