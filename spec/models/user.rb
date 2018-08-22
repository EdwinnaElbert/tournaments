# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.create :user }
  let!(:survey) { FactoryBot.create :survey, user_id: user.id }

  describe 'Associations' do
    it { is_expected.to have_many(:surveys) }
    it { is_expected.to have_many(:survey_user_answers) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
end
