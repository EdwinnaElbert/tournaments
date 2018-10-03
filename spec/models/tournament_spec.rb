require "rails_helper"

RSpec.describe Tournament, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build :tournament, :with_many_teams).to be_valid
  end

  describe "associations" do
    it { should have_and_belong_to_many :teams }
    it { should have_many :groups }
  end

  describe "validations" do
    it { should validate_presence_of :title }
  end
end
