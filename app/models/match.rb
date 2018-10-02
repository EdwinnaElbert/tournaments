# frozen_string_literal: true

class Match < ApplicationRecord
  # belongs_to :team
  # belongs_to :team_1, class_name: "Team", foreign_key: :team_1_id
  # belongs_to :team_2, class_name: "Team", foreign_key: :team_2_id
  belongs_to :group

  has_many :scores
  # has_one :team_1_score, class_name: "Score", foreign_key: :team_id, primary_key: :team_1_id
  # has_one :team_2_score, class_name: "Score", foreign_key: :team_id, primary_key: :team_2_id
end
