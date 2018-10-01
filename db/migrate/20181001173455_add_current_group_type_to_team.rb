class AddCurrentGroupTypeToTeam < ActiveRecord::Migration[5.2]
  def up
    add_column :teams, :current_group_type, :integer
  end

  def down
    remove_column :teams, :current_group_type
  end
end
