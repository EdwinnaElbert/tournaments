class CreateSurveyUserAnswers < ActiveRecord::Migration[5.2]
  def up
    create_table :survey_user_answers, id: :uuid, default: 'uuid_generate_v1()' do |t|
      t.string  :answer
      t.integer :weight
      t.text    :survey_question_answer_ids, array: true, default: []
      t.belongs_to :survey_question, type: :uuid, foreign_key: true
      t.belongs_to :user, type: :uuid, foreign_key: true
      t.belongs_to :survey, type: :uuid, foreign_key: true
      t.belongs_to :survey_question_answer, type: :uuid, foreign_key: true
    end
  end

  def down
    drop_table :survey_user_answers
  end
end
