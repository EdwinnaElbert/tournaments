require "rails_helper"
RSpec.describe Team, type: :model do

  # it "has a valid factory" do
  #   expect(FactoryBot.build :team).to be_valid
  # end

  describe "associations" do
    it { should have_and_belong_to_many :tournaments }
    it { should belong_to :group }
    it { should have_many :scores }
    it { should have_many :matches }
  end

  describe "validations" do
    it { should validate_presence_of :title }
  end
end
