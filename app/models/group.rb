# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :tournament

  has_many :matches
  has_many :scores, through: :matches
  has_many :teams, through: :matches

  validates :group_type, presence: :true
  enum group_type: [
    :a,             # 0
    :b,             # 1
    :play_off_1_4,  # 2
    :play_off_1_2,  # 3
    :final          # 4
  ]
end
