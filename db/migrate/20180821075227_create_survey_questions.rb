# frozen_string_literal: true

class CreateSurveyQuestions < ActiveRecord::Migration[5.2]
  def up
    create_table :survey_questions, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.text :question, null: false, default: ""
      t.integer :weight, null: false
      t.integer :question_type, null: false
      t.belongs_to :survey, type: :uuid, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :survey_questions
  end
end
