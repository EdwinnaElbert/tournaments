# class CreateMatch < ActiveRecord::Migration[5.2]
#   def change
#     create_table :matches, id: :uuid, default: "uuid_generate_v1()" do |t|
#       t.belongs_to :group, null: false, foreign_key: true, type: :uuid
#
#       t.timestamps
#     end
#   end
# end
