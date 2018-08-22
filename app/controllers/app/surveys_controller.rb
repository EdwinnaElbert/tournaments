# frozen_string_literal: true

class App::SurveysController < AppController
  # # before_action -> { can_action('surveys') }
  # # before_action -> { can_action('surveys_add') }, only: [:new, :create, :edit, :update, :destroy]
  #
  # def index
  #   @page_title = 'Surveys'
  #   @surveys = Survey.order_by('start_datetime' => 'asc')
  #   @surveys = @surveys.page(params[:page]).per(@per_page)
  # end
  #
  # def new
  #   @page_title = 'Add Surveys'
  #   @survey = Survey.new(start_datetime: DateTime.now.in_time_zone('Moscow'))
  # end
  #
  # def create
  #   @survey = Survey.new(survey_params)
  #   @survey.user_id = current_user.id
  #   if @survey.save
  #     params[:survey][:survey_questions_attributes].to_h.each_with_index do |pq, i|
  #       q = pq[1]
  #       question = SurveyQuestion.new
  #       question.survey_id = @survey.id
  #       question.question = q[:title]
  #       question.question_type = q[:question_type]
  #       question.weight = i
  #       if question.save!
  #         q[:survey_question_answers_attributes].to_h.each_with_index do |an, k|
  #           a = an[1]
  #           answer = SurveyQuestionAnswer.new
  #           answer.survey_question_id = question.id
  #           answer.answer = a[:title]
  #           answer.weight = k
  #           answer.save!
  #         end
  #       end
  #     end
  #     # @survey.send_create_push
  #     # SurveyToFileWorker.perform_async(@survey.id.to_s)
  #   else
  #     redirect_to app_surveys_path(), flash: { alert: 'Survey not created!' }
  #   end
  #   redirect_to app_surveys_path(), flash: { notice: 'Survey successfully created!' }
  # end
  #
  # def edit
  #   @page_title = 'Edit Surveys'
  #   @survey = Survey.find(params[:id])
  # end
  #
  # def update
  #   @survey = Survey.find(params[:id])
  #   if @survey.update_attributes(survey_params)
  #     params[:survey][:survey_questions_attributes].to_h.each_with_index do |pq, i|
  #       q = pq[1]
  #       if q[:id].blank? && q[:_delete].to_i == 0
  #         question = SurveyQuestion.new
  #       elsif !q[:id].blank? && q[:_delete].to_i == 1
  #         question = SurveyQuestion.find(q[:id])
  #         question.survey_question_answers.delete_all
  #         question.delete
  #         next
  #       elsif !q[:id].blank? && q[:_delete].to_i == 0
  #         question = SurveyQuestion.find(q[:id])
  #       end
  #       next if q[:title].blank?
  #       question.survey_id = @survey.id
  #       question.question = q[:title]
  #       question.question_type = q[:question_type]
  #       question.weight = i
  #       if question.save!
  #         q[:survey_question_answers_attributes].to_h.each_with_index do |an, k|
  #           a = an[1]
  #           if a[:id].blank? && a[:_delete].to_i == 0
  #             answer = SurveyQuestionAnswer.new
  #           elsif !a[:id].blank? && a[:_delete].to_i == 1
  #             answer = SurveyQuestionAnswer.find(a[:id])
  #             answer.delete
  #             next
  #           elsif !a[:id].blank? && a[:_delete].to_i == 0
  #             # puts '------------------------#{a[:id]}'
  #             answer = SurveyQuestionAnswer.find(a[:id])
  #           end
  #           next if a[:title].blank?
  #           answer.survey_question_id = question.id
  #           answer.answer = a[:title]
  #           answer.weight = k
  #           answer.save!
  #         end
  #       end
  #     end
  #     @survey.send_update_push
  #   end
  #   redirect_to app_surveys_path(), flash: { notice: 'Survey successfully updated!' }
  # end
  #
  # def destroy
  #   @survey = Survey.find(params[:id])
  #   redirect_to app_surveys_path(), flash: { alert: 'Survey not found!' } if @survey.blank?
  #
  #   @survey.survey_questions.each do |q|
  #     q.survey_question_answers.delete_all
  #     q.delete
  #   end
  #   @survey.send_destroy_push
  #   @survey.delete
  #   redirect_to app_surveys_path(), flash: { notice: 'Survey successfully deleted!' }
  # end
  #
  # def export_excel
  #   @survey = Survey.find(params[:id])
  #   redirect_to app_surveys_path(), flash: { alert: 'Survey not found!' } if @survey.blank?
  #   # send_data @survey.export_to_excel, type: 'application/xlsx',
  #   #     filename: 'Survey report. #{@survey.title}_#{Time.zone.now.strftime('%Y-%m-%d')}.xlsx'
  #   begin
  #     file_name = '/data/fifa/current/tmp/survey_#{@survey.id.to_s}.xlsx'
  #     send_file file_name, type: 'text/xlsx;', disposition: 'attachment; filename=Survey report. #{@survey.title}_#{Time.zone.now.strftime('%Y-%m-%d')}.xlsx'
  #   rescue
  #     redirect_to app_surveys_path(), flash: { alert: 'Survey file do not generating, please try again in 30 minutes!' }
  #   end
  # end
  #
  # private
  #
  #
  #   def survey_params
  #     params.require(:survey).permit!
  #   end
end
