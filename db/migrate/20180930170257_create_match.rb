class CreateMatch < ActiveRecord::Migration[5.2]
  def change
    create_table :matches, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.belongs_to :team_1, type: :uuid, null: false
      t.belongs_to :team_2, type: :uuid, null: false
      t.belongs_to :group, null: false, foreign_key: true, type: :uuid
    end
  end
end
