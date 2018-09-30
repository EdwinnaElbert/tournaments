class CreateGames < ActiveRecord::Migration[5.2]
  def up
    create_table :games, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.integer    :game_type, null: false
      t.belongs_to :tournament, null: false, foreign_key: true, type: :uuid
      t.uuid       :team_1_id,  null: false
      t.integer    :score_1, null: false
      t.uuid       :team_2_id,  null: false
      t.integer    :score_2, null: false
      t.boolean    :judge_decision_win, default: false
    end
  end

  def down
    drop_table :games
  end
end
