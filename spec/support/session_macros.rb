module SessionMacros
  def sign_in(user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_on 'Log in'
    # expect(page).to have_content t('devise.sessions.signed_in')
    expect(current_path).to eq '/'
  end

  def sign_in_by_phone(user)
    visit new_user_session_path
    fill_in 'user_phone', with: user.phone
    fill_in 'user_password', with: user.password

    click_on 'Sign up'
    expect(User.all.count).to eq 1
    # expect(page).to have_content t('devise.sessions.signed_in')
  end
end
