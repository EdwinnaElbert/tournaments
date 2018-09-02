# frozen_string_literal: true

require "feature_helper"

feature "Signed in user who has already one survey creates a survey" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:survey) { FactoryBot.create(:survey, user: user) }

  # scenario "with valid attrs", js: true do
  #   sign_in(user)
  #   expect(Survey.all.count).to eq(1)
  #   expect(page).to have_content("Create Survey")
  #   find("#add_survey").click
  #   # 27/11/2018 -- invalid date, т.к. первым идет месяц
  #   find("#m_datepicker_1").set("11/27/2018")
  #   find("#m_datepicker_2").set("12/27/2018")
  #   fill_in "survey_title", with: "New survey title"
  #   fill_in "survey_description", with: "Lorem Ipsum"
  #   find("#click_is_anonymous").click
  #   find("#add_only_answer").click
  #   find("#survey_question_title_0").set("Question 1")
  #   fill_in "survey_question_answer_title_0_0", with: "Answer option 1"
  #   find("#add_multiple_answer").click
  #   find("#survey_question_title_1").set("Question 2")
  #   fill_in "survey_question_answer_title_1_0", with: "Answer option 2"
  #   find("#add_free_answer").click
  #   find("#survey_question_title_2").set("Question 2")
  #   click_on I18n.t("surveys.create")
  #
  #   expect(current_path).to eq(my_surveys_path)
  #   expect(Survey.all.count).to eq(2)
  #   expect(Survey.order("created_at Desc").first.survey_questions.count).to eq(3)
  # end

  scenario "valid; with option removal", js: true do
    sign_in(user)
    expect(Survey.all.count).to eq(1)
    expect(page).to have_content("Create Survey")
    find("#add_survey").click
    # 27/11/2018 -- invalid date, т.к. первым идет месяц
    find("#m_datepicker_1").set("11/27/2018")
    find("#m_datepicker_2").set("12/27/2018")
    fill_in "survey_title", with: "New survey title"
    fill_in "survey_description", with: "Lorem Ipsum"
    find("#click_is_anonymous").click
    find("#add_only_answer").click
    
    find("#survey_question_title_0").set("Question 1")
    fill_in "survey_question_answer_title_0_0", with: "Answer option 1"
    find("#add_option_0").click
    fill_in "survey_question_answer_title_0_1", with: "Should not be saved"
    find("#add_option_0").click
    fill_in "survey_question_answer_title_0_2", with: "Answer option 3"
    find("#remove_option_0_1").click

    # find("#add_multiple_answer").click
    # find("#survey_question_title_1").set("Question 2")
    # fill_in "survey_question_answer_title_1_0", with: "Answer option 2"
    # find("#add_free_answer").click
    # find("#survey_question_title_2").set("Question 2")
    click_on I18n.t("surveys.create")

    expect(current_path).to eq(my_surveys_path)
    expect(Survey.all.count).to eq(2)
    expect(Survey.order("created_at Desc").first.survey_questions.count).to eq(3)
  end
end
# TODO user who hasn"t got surveys creates a survey
