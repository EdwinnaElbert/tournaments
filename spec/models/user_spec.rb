require "rails_helper"
RSpec.describe User, type: :model do
  it "has a valid factory" do
    password = Faker::Internet.password
    expect(FactoryBot.build :user, password: password, password: password).to be_valid
  end

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
