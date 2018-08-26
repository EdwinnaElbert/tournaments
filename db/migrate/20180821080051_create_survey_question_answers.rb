# frozen_string_literal: true

class CreateSurveyQuestionAnswers < ActiveRecord::Migration[5.2]
  def up
    create_table :survey_question_answers, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.string :answer, null: false
      t.integer :weight, null: false
      t.belongs_to :survey_question, type: :uuid, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :survey_question_answers
  end
end
