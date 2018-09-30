# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :tournament

  validates :game_type, :team_1_id, :team_2_id, :score_1, :score_2, presence: :true
end
