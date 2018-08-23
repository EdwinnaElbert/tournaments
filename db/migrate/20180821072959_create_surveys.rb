# frozen_string_literal: true

class CreateSurveys < ActiveRecord::Migration[5.2]
  def up
    create_table :surveys, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.string :title
      t.string :description
      t.boolean :is_anonymous
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime
      t.belongs_to :user, type: :uuid, foreign_key: true
    end

    add_index :surveys, :start_datetime
    add_index :surveys, :end_datetime
  end

  def down
    drop_table :surveys
  end
end
