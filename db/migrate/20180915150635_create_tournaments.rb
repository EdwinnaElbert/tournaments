# class CreateTournaments < ActiveRecord::Migration[5.2]
#   def up
#     create_table :tournaments, id: :uuid, default: "uuid_generate_v1()" do |t|
#       t.string  :title,  null: false
#       t.boolean :active, null: false, default: true
#
#       t.timestamps
#     end
#   end
#
#   def down
#     drop_table :tournaments
#   end
# end
