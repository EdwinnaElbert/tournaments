# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 2018_08_22_061557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "survey_question_answers", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.string "answer", null: false
    t.integer "weight", null: false
    t.uuid "survey_question_id"
    t.index ["survey_question_id"], name: "index_survey_question_answers_on_survey_question_id"
  end

  create_table "survey_questions", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.text "question", default: "", null: false
    t.integer "weight", null: false
    t.integer "question_type", null: false
    t.uuid "survey_id"
    t.index ["survey_id"], name: "index_survey_questions_on_survey_id"
  end

  create_table "survey_user_answers", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.string "answer"
    t.integer "weight"
    t.text "survey_question_answer_ids", default: [], array: true
    t.uuid "survey_question_id"
    t.uuid "user_id"
    t.uuid "survey_id"
    t.uuid "survey_question_answer_id"
    t.index ["survey_id"], name: "index_survey_user_answers_on_survey_id"
    t.index ["survey_question_answer_id"], name: "index_survey_user_answers_on_survey_question_answer_id"
    t.index ["survey_question_id"], name: "index_survey_user_answers_on_survey_question_id"
    t.index ["user_id"], name: "index_survey_user_answers_on_user_id"
  end

  create_table "surveys", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "is_anonymous"
    t.datetime "start_datetime", null: false
    t.datetime "end_datetime"
    t.uuid "user_id"
    t.index ["end_datetime"], name: "index_surveys_on_end_datetime"
    t.index ["start_datetime"], name: "index_surveys_on_start_datetime"
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v1()" }, force: :cascade do |t|
    t.string "phone", default: "", null: false
    t.string "email", default: "", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "patronymic"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "survey_question_answers", "survey_questions"
  add_foreign_key "survey_questions", "surveys"
  add_foreign_key "survey_user_answers", "survey_question_answers"
  add_foreign_key "survey_user_answers", "survey_questions"
  add_foreign_key "survey_user_answers", "surveys"
  add_foreign_key "survey_user_answers", "users"
  add_foreign_key "surveys", "users"
end
