class AddWinnerToTournaments < ActiveRecord::Migration[5.2]
  def up
    add_reference :tournaments, :winner, references: :teams, type: :uuid
  end

  def down
    remove_reference :tournaments, :winner
  end
end
