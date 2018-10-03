require "rails_helper"
RSpec.describe Score, type: :model do
  # it "has a valid factory" do
  #   expect(FactoryBot.build :score).to be_valid
  # end

  describe "associations" do
    it { should belong_to :team }
    it { should belong_to :match }
  end
end
