# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    group_type  0
    association :tournament, :with_many_teams
  end
end
