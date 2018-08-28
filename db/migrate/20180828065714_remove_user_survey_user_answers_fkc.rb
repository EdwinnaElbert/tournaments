class RemoveUserSurveyUserAnswersFkc < ActiveRecord::Migration[5.2]
  def change
    if foreign_key_exists?(:survey_user_answers, :users)
      remove_foreign_key :survey_user_answers, :users
    end
  end
end
