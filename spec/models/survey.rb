
require 'rails_helper'

RSpec.describe Survey, type: :model do
  let!(:user) { FactoryBot.create :user }
  let!(:survey) { FactoryBot.create :survey, user_id: user.id, is_anonymous: true }
  # ActiveRecord::RecordInvalid: Validation failed: Is anonymous can't be blank
  # если is_anonymous из фабрики
  # let!(:survey) { FactoryBot.create :survey, user_id: user.id }
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:survey_user_answers) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:is_anonymous) }
    it { should validate_presence_of(:start_datetime) }
    it { should validate_presence_of(:user_id) }
  end
end
