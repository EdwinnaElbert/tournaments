
require "feature_helper"

feature "Signed in user who has already one survey creates a survey" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:survey) { FactoryBot.create(:survey, user: user) }

  scenario "with valid email and password", :js => true do
    sign_in(user)

    expect(page).to have_content('Create Survey')
    # find('#add_survey').click # не работает кнопка в тестах

    visit new_my_survey_path
    # expect(current_path).to eq new_my_survey_path
    expect(page).to have_content('Description')
    fill_in 'survey_title', with: 'New survey title'
    fill_in 'survey_description', with: 'Lorem Ipsum'
    find('#click_is_anonymous').click
    find('#add_only_answer').click # не работает
    page.execute_script("add_multiple_choice")
    sleep 1
    expect(page).to have_content('Question # 1 (Only answer)')
    find('#survey_question_title_1').set('Question 1')
    # fill_in 'survey_question_answer_title_1', with: 'Answer option 1'
    # find('Add option').click
    # fill_in 'survey_question_answer_title_1', with: 'Answer option 2'

    # fill_in 'survey_title', name: /survey[survey_questions_attributes]/, with: 'Question title'
  end
end

# TODO user who hasn't git surveys creates a survey
