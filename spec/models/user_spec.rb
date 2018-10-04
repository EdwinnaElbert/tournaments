require "rails_helper"
RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build :user).to be_valid
  end

  describe "associations" do
  end

  describe "validations" do
    it { should validate_presence_of :email }
    # it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

    it { should validate_length_of(:password).is_at_least(6).is_at_most(128) }
    it { should validate_presence_of :password }
  end
end
