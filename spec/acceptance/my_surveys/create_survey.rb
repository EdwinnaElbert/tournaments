# frozen_string_literal: true

require "feature_helper"

feature "Signed in user who has already one survey creates a survey" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:survey) { FactoryBot.create(:survey, user: user) }

  scenario "with valid attrs", :js => true do
    sign_in(user)
    expect(Survey.all.count).to eq(1)
    expect(page).to have_content("Create Survey")
    find('#add_survey').click

    expect(page).to have_content('Description')
    # 27/11/2018 -- invalid date, т.к. первым идет месяц
    find('.survey_start_datetime').set('11/27/2018')
    find('.survey_end_datetime').set('12/27/2018')
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

    expect(current_path).to eq(my_surveys_path)
    expect(Survey.all.count).to eq(2)
    # expect(Survey.order('created_at Desc').first.survey_questions.count).to eq(3)
  end

#   scenario "valid; with option removal", :js => true do
#     sign_in(user)
#     expect(Survey.all.count).to eq(1)
#     expect(page).to have_content("Create Survey")
#
#     find('#add_survey').click
#
#     expect(page).to have_content('Description')
#     # 27/11/2018 -- invalid date, т.к. первым идет месяц
#     find('.survey_start_datetime').set('11/27/2018')
#     find('.survey_end_datetime').set('12/27/2018')
#     fill_in 'survey_title', with: 'New survey title'
#     fill_in 'survey_description', with: 'Lorem Ipsum'
#     find('#click_is_anonymous').click
#     find('#add_only_answer').click
#     expect(page).to have_content('Question # 1 (Only answer)')
#     find('#survey_question_title_1').set('Question 1')
#     fill_in 'survey_question_answer_title_1', with: 'Answer option 1'
#     click_on 'Remove Question'
#     find('#add_multiple_answer').click
#     find('#add_multiple_answer').click
#     find('#survey_question_title_2').set('Question 2')
#     fill_in 'survey_question_answer_title_2', with: 'Answer option 2'
#     find('#add_free_answer').click
#     # expect(page).to have_content('Question # 2 (Free answer)')
#     # find('#survey_question_title_2').set('Question 2')
#     click_on 'Create'
#     expect(current_path).to eq(my_surveys_path)
#     # expect(Survey.all.count).to eq(2)
#     # expect(Survey.order('created_at Desc').first.survey_questions.count).to eq(3)
#   end
end
# TODO user who hasn't git surveys creates a survey
