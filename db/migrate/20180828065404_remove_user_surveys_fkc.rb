class RemoveUserSurveysFkc < ActiveRecord::Migration[5.2]
  def change
    if foreign_key_exists?(:surveys, :users)
      remove_foreign_key :surveys, :users
    end
  end
end
