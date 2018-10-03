require "rails_helper"
RSpec.describe Match, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build :match).to be_valid
  end

  describe "associations" do
    it { should belong_to :group }
    it { should have_many :scores }
    it { should have_many :teams }
  end
end
