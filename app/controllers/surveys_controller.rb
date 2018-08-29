# frozen_string_literal: true

class SurveysController < AppController
  # # before_action -> { can_action('surveys') }
  # # before_action -> { can_action('surveys_add') }, only: [:new, :create, :edit, :update, :destroy]
  def index
    @page_title = "Surveys"
    @surveys = Survey.order("start_datetime asc")
    # @surveys = @surveys.page(params[:page]).per(@per_page)
  end

  def answer
    @survey = Survey.find(params[:id])
    authenticate_user! unless @survey.is_anonymous
  end

  def answer_survey
    binding.pry
  end

  private


    def answers_params
      params.require(:answers).permit([:answer, :question_id, :survey_question_answer_ids, :survey_question_answer_id, :survey_question_id])
    end
end
