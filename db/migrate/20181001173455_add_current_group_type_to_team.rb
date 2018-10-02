class AddCurrentGroupTypeToTeam < ActiveRecord::Migration[5.2]
  def up
    add_reference :teams, :group, foreign_key: true, type: :uuid
  end

  def down
    remove_reference :teams, :group
  end
end
