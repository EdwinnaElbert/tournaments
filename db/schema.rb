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

ActiveRecord::Schema.define(version: 2018_10_03_171231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "groups", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.integer "group_type", null: false
    t.uuid "tournament_id", null: false
    t.index ["tournament_id"], name: "index_groups_on_tournament_id"
  end

  create_table "matches", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.uuid "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_matches_on_group_id"
  end

  create_table "scores", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.uuid "team_id", null: false
    t.uuid "match_id", null: false
    t.integer "score"
    t.index ["match_id"], name: "index_scores_on_match_id"
    t.index ["team_id"], name: "index_scores_on_team_id"
  end

  create_table "teams", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.string "title", null: false
    t.boolean "off", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams_tournaments", force: :cascade do |t|
    t.uuid "tournament_id", null: false
    t.uuid "team_id", null: false
    t.index ["team_id"], name: "index_teams_tournaments_on_team_id"
    t.index ["tournament_id"], name: "index_teams_tournaments_on_tournament_id"
  end

  create_table "tournaments", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.string "title", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
    t.integer "min_score", default: 0, null: false
    t.integer "max_score", default: 100, null: false
    t.uuid "winner_id"
    t.index ["winner_id"], name: "index_tournaments_on_winner_id"
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

  add_foreign_key "groups", "tournaments"
  add_foreign_key "matches", "groups"
  add_foreign_key "scores", "matches"
  add_foreign_key "scores", "teams"
  add_foreign_key "teams_tournaments", "teams"
  add_foreign_key "teams_tournaments", "tournaments"
  add_foreign_key "tournaments", "teams", column: "winner_id"
end
