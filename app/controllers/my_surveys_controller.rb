# frozen_string_literal: true

class MySurveysController < AppController
  before_action :authenticate_user!

  def index
    @page_title = "My Surveys"
    @surveys = current_user.surveys.order("start_datetime asc")
    # @surveys = @surveys.page(params[:page]).per(@per_page)
  end

  def new
    @page_title = "Add Surveys"
    @survey = Survey.new()
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user_id = current_user.id
    if @survey.save
      redirect_to my_surveys_path(), flash: { notice: 'Survey successfully created!' }
    else
      redirect_to new_my_survey_path(), flash: { alert: 'Survey not created!' }
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)
      redirect_to my_surveys_path(), flash: { notice: 'Survey successfully updated!' }
    else
      redirect_to new_my_survey_path(@survey)
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    redirect_to app_surveys_path(), flash: { alert: 'Survey not found!' } if @survey.blank?
    @survey.destroy
    redirect_to my_surveys_path(), flash: { notice: 'Survey successfully deleted!' }
  end

  private

    def survey_params
      params["survey"]["start_datetime"] = Date.strptime(params["survey"]["start_datetime"], "%m/%d/%Y") unless params["survey"]["start_datetime"].is_a?(Date) || params["survey"]["end_datetime"] == ""
      params["survey"]["end_datetime"] = Date.strptime(params["survey"]["end_datetime"], "%m/%d/%Y") unless params["survey"]["end_datetime"].is_a?(Date) || params["survey"]["end_datetime"] == ""
      # params["survey"]["survey_questions_attributes"].values.each { |q| q.delete("_delete") } if params["survey"]["survey_questions_attributes"].present?
      # params["survey"]["survey_question_answers_attributes"].values.each { |a| a.delete("_delete") } if params["survey"]["survey_question_answers_attributes"].present?

      params.require(:survey).permit!
      # params.require(:survey).permit(:title, :description, :is_anonymous, :start_datetime, :end_datetime, { survey_questions_attributes: [  :question, :question_type, :id, :_delete, :weight, { survey_question_answers_attributes: [ :answer, :id, :_delete, :weight ]}]})
    end
end
