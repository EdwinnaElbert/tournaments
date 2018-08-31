# frozen_string_literal: true

class SurveysController < AppController
  before_action -> { set_survey }

  def answer
    authenticate_user! unless @survey.is_anonymous
    # redirect_to :show_answers if cookies[:already_answered] == "true"
  end

  def answer_survey
    # cookies[:already_answered] = SecureRandom.uuid
    begin
      SurveyUserAnswer.create(params_hash)
      redirect_to show_answers_survey_path
    rescue
      redirect_to answer_survey_path(@survey)
    end
  end

  def show_answers
    if current_user
      @user_answers = SurveyUserAnswer.where(user_id: current_user.id, survey_id: @survey.id)
    else
      
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
