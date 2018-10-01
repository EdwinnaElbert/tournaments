# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :home_team, class_name: "Team", foreign_key: :team_1_id
  belongs_to :visitor_team, class_name: "Team", foreign_key: :team_2_id
  belongs_to :group

  has_many :scores
end
