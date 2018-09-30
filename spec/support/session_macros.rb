# frozen_string_literal: true

module SessionMacros
  def sign_in(user)
    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password

    click_on I18n.t("devise.sessions.new.sign_in")
    # expect(page).to have_content t('devise.sessions.signed_in')
    expect(current_path).to eq "/"
  end
end
