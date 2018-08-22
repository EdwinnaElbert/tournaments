# frozen_string_literal: true

class AddNameToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :patronymic, :string
  end

  def down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :patronymic
  end
end
