class AddCurrentStateToTournament < ActiveRecord::Migration[5.2]
  def up
    add_column :tournaments, :current_state, :string
  end

  def down
    remove_column :tournaments, :current_state  
  end
end
