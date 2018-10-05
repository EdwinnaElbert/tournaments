class AddAasmStateToTournament < ActiveRecord::Migration[5.2]
  def up
    add_column :tournaments, :aasm_state, :string
  end

  def down
    remove_column :tournaments, :aasm_state
  end
end
