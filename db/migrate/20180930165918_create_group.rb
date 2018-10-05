class CreateGroup < ActiveRecord::Migration[5.2]
  def up
    create_table :groups, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.integer :group_type, null: false
      t.belongs_to :tournament, null: false, foreign_key: true, type: :uuid
    end
  end

  def down
    drop_table :groups
  end
end
