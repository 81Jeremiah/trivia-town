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

ActiveRecord::Schema.define(version: 2018_10_03_025227) do

  create_table "answers", force: :cascade do |t|
    t.text "answer"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quiz_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "guess"
    t.integer "score", default: 0
  end

  create_table "question_and_answers", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.integer "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quiz_id"
  end

  create_table "quiz_scores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "quiz_id"
    t.integer "score"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.integer "quiz_score_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
