
require "feature_helper"

feature "Signed in user creates a survey" do
  let!(:user) { FactoryBot.create(:user) }
  before(:each) do
    sign_in(user)
    click_on 'Create survey'
  end
  scenario "with valid email and password" do
    fill_in 'survey_title', with: 'New survey title'
  end
end
