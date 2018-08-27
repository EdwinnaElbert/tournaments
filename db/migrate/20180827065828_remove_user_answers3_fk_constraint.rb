class RemoveUserAnswers3FkConstraint < ActiveRecord::Migration[5.2]
  def change
    if foreign_key_exists?(:survey_user_answers, :survey_questions)
      remove_foreign_key :survey_user_answers, :survey_questions
    end
  end
end
