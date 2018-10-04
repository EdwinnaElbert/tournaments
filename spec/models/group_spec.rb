require "rails_helper"
RSpec.describe Group, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build :group).to be_valid
  end

  describe "associations" do
    it { should belong_to :tournament }
    it { should have_many :matches }
    it { should have_many :scores }
    it { should have_many :teams }
  end

  describe "validations" do
    it { should validate_presence_of :group_type }
  end
end
