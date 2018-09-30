require "rails_helper"
RSpec.describe Team, type: :model do
  it "has a valid factory" do
    # you can create only 16 teams at once
    # expect(FactoryBot.build :team).to_not be_valid
  end

  describe "associations" do
    it { should belong_to :tournament }
  end

  describe "validations" do
    it { should validate_inclusion_of(:off).in_array([true, false]) }
    it { should validate_presence_of :title }
  end
end
