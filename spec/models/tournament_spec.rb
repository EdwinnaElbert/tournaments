require "rails_helper"
RSpec.describe Tournament, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build :tournament).to_not be_valid
    # expect(FactoryBot.build :tournament_with_teams, teams_count: 16).to be_valid
  end

  describe "associations" do
    it { should have_many :teams }
    it { should have_many :games }
  end

  describe "validations" do
    it { should validate_presence_of :title }
  end
end
