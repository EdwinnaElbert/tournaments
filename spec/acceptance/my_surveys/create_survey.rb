# frozen_string_literal: true

require "feature_helper"

feature "Signed in user who has already one survey creates a survey" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:survey) { FactoryBot.create(:survey, user: user) }

  scenario "with valid email and password" do
    sign_in(user)

    expect(page).to have_content("Create Survey")
    # click_on 'add_survey'

    visit new_my_survey_path
    expect(current_path).to eq new_my_survey_path
    expect(page).to have_content("Description")
    fill_in "survey[title]", with: "New survey title"
    fill_in "survey_description", with: "Lorem Ipsum"
    check "survey_is_anonymous"
    click_on "Add Only answer"
  end
end

# TODO user who hasn't git surveys creates a survey
