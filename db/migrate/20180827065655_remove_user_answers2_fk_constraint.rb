class RemoveUserAnswers2FkConstraint < ActiveRecord::Migration[5.2]
  def change
    if foreign_key_exists?(:survey_user_answers, :survey_question_answers)
      remove_foreign_key :survey_user_answers, :survey_question_answers
    end
  end
end
