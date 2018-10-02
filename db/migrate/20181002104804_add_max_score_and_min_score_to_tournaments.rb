class AddMaxScoreAndMinScoreToTournaments < ActiveRecord::Migration[5.2]
  def up
    add_column :tournaments, :min_score, :integer, null: false, default: 0
    add_column :tournaments, :max_score, :integer, null: false, default: 100
  end

  def down
    remove_column :tournaments, :min_score
    remove_column :tournaments, :max_score
  end
end
