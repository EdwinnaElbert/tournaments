class CreateTeams < ActiveRecord::Migration[5.2]
  def up
    create_table :teams, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.string     :title,      null: false
      t.belongs_to :tournament, null: false, foreign_key: true, type: :uuid
      t.boolean    :off,        null: false, default: false
    end
  end

  def down
    drop_table :teams
  end
end
