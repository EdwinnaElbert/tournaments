module RegistrationMacros
  def sign_up
    visit new_user_registration_path
    fill_in 'user_first_name', with: 'first_name'
    fill_in 'user_last_name', with: 'last_name'
    fill_in 'user_patronymic', with: 'patronymic'
    fill_in 'user_email', with: 'email@test.com'
    fill_in 'user_phone', with: 'phone'
    fill_in 'user_password', with: 'password'

    click_on 'Sign up'
    expect(User.all.count).to eq 1
    # expect(page).to have_content t('devise.sessions.signed_in')
  end
end
