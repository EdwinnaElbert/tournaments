class RemoveIndexFromPhone < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :phone
  end
end
