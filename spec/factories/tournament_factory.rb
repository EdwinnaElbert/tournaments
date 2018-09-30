# frozen_string_literal: true

FactoryBot.define do
  factory :tournament do
    title { Faker::Alphanumeric.alphanumeric(10) }
    active true

    # TODO find out how I can create parent and children factories at once
    # factory :tournament_with_teams do
    #   transient do
    #     teams_count { 16 }
    #   end
    #   before(:create) do |tournament, evaluator|
    #     build_list(:team, evaluator.teams_count, tournament: tournament)
    #   end
    # end
  end
end
