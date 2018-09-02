# frozen_string_literal: true

class SurveysController < AppController
  before_action -> { set_survey }

  def answer
    authenticate_user! unless @survey.is_anonymous
    render 'thank_you' if cookies[:already_answered].try(:include?, @survey.id)
  end

  def answer_survey
    begin
      SurveyUserAnswer.create(params_hash)
      cookies[:answered_surveys] ||= []
      cookies[:answered_surveys] << @survey.id
      redirect_to show_answers_survey_path
    rescue
      redirect_to answer_survey_path(@survey)
    end
  end

  def show_answers
    if current_user
      @user_answers = SurveyUserAnswer.where(user_id: current_user.id, survey_id: @survey.id)
      render 'show_answers'
    end
  end

  private

    def set_survey
      @survey = Survey.find(params[:id])
    end

    def answers_params
      params.permit(answers: [:answer, :survey_question_id, { survey_question_answer_ids: [] }, :survey_question_answer_id, :survey_question_id])
    end

    def params_hash
      answers_params.values.first.to_h.values.each do |v|
        v.merge!(user_id: current_user.id, survey_id: @survey.id)
      end
    end
end
