# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_29_125958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "games", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.integer "game_type", null: false
    t.uuid "tournament_id", null: false
    t.uuid "team_1_id", null: false
    t.integer "score_1", null: false
    t.uuid "team_2_id", null: false
    t.integer "score_2", null: false
    t.boolean "judge_decision_win", default: false
    t.index ["tournament_id"], name: "index_games_on_tournament_id"
  end

  create_table "teams", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.string "title", null: false
    t.uuid "tournament_id", null: false
    t.boolean "off", default: false, null: false
    t.index ["tournament_id"], name: "index_teams_on_tournament_id"
  end

  create_table "tournaments", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.string "title", null: false
    t.boolean "active", default: true, null: false
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.string "phone"
    t.string "email", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "tournaments"
  add_foreign_key "teams", "tournaments"
end
