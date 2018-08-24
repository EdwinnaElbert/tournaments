
require "feature_helper"

feature "Signed in user who has already one survey creates a survey" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:survey) { FactoryBot.create(:survey, user: user) }

  scenario "with valid email and password", :js => true do
    sign_in(user)

    expect(page).to have_content('Create Survey')
    find('#add_survey').click

    expect(page).to have_content('Description')
    fill_in 'survey_title', with: 'New survey title'
    fill_in 'survey_description', with: 'Lorem Ipsum'
    find('#click_is_anonymous').click
    find('#add_only_answer').click
    expect(page).to have_content('Question # 1 (Only answer)')
    find('#survey_question_title_1').set('Question 1')
    fill_in 'survey_question_answer_title_1', with: 'Answer option 1'
    find('#add_multiple_answer').click
    find('#survey_question_title_2').set('Question 2')
    fill_in 'survey_question_answer_title_2', with: 'Answer option 2'
    find('#add_free_answer').click
    expect(page).to have_content('Question # 3 (Free answer)')
    find('#survey_question_title_3').set('Question 3')
    click_on 'Create'
    expect(Survey.all.count).to eq(2)
    expect(Survey.order('created_at Desc').first.survey_questions.count).to eq(3)
  end
end

# TODO user who hasn't git surveys creates a survey
