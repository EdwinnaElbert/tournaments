# frozen_string_literal: true

require "feature_helper"

feature "User signs in" do
  let!(:user) { FactoryBot.create(:user) }

  scenario "with valid email and password" do
    sign_in(user)
  end

  scenario "with invalid email" do
    visit new_user_session_path
    fill_in "user_email", with: "some string"
    fill_in "user_password", with: user.password

    click_on "Log in"
    expect(current_path).to eq new_user_session_path
  end

  scenario "with invalid password" do
    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: "some wrong password"

    click_on "Log in"
    expect(current_path).to eq new_user_session_path
  end
end
