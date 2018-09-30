require "rails_helper"
RSpec.describe Game, type: :model do
  it "has a valid factory" do
    # expect(FactoryBot.build :game).to be_valid
  end

  describe "associations" do
    it { should belong_to :tournament }
  end

  describe "validations" do
    it { should validate_presence_of :game_type }
    it { should validate_presence_of :team_1_id }
    it { should validate_presence_of :team_2_id }
    it { should validate_presence_of :score_1 }
    it { should validate_presence_of :score_2 }
  end
end
