class CreateScore < ActiveRecord::Migration[5.2]
  def up
    create_table :scores, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.belongs_to :team,  null: false, foreign_key: true, type: :uuid
      t.belongs_to :match, null: false, foreign_key: true, type: :uuid
      t.integer :score
    end
  end

  def down
    drop_table :scores
  end
end
