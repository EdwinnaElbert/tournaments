# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :tournament

  validates :game_type, :team_1_id, :team_2_id, :score_1, :score_2, presence: :true
  enum game_type: [
    :a,             # 0
    :b,             # 1
    :play_off_1_4,  # 2
    :play_off_1_2,  # 3
    :final          # 4
  ]
end
