class RemoveUserAnswersFkConstraint < ActiveRecord::Migration[5.2]
  def change
    if foreign_key_exists?(:survey_user_answers, :surveys)
      remove_foreign_key :survey_user_answers, :surveys
    end
  end
end
