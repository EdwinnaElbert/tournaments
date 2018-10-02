# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :tournament
  belongs_to :group, required: false
  has_many :scores, through: :matches

  has_many :home_matches, class_name: "Match", foreign_key: "team_1_id"
  has_many :visitor_matches, class_name: "Match", foreign_key: "team_2_id"
  # has_many :matches, -> { self.games_1 + self.games_2 }
  validates :title, presence: :true
  validates :off, inclusion: { in: [true, false], message: "Off should be set to true or false" }
  # enum current_group_type: [
  #   :a,             # 0
  #   :b              # 1
  # ]
end
