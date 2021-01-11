# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20210111051837) do

  create_table "daily_logs", force: :cascade do |t|
    t.date   "date"
    t.string "title"
    t.text   "description"
  end

  create_table "entry", force: :cascade do |t|
    t.date    "date"
    t.integer "journal_id"
  end

  create_table "fitness_entries", force: :cascade do |t|
    t.date   "date"
    t.string "workout"
    t.string "length"
    t.text   "description"
  end

  create_table "food_log_entries", force: :cascade do |t|
    t.date    "date"
    t.text    "breakfast"
    t.text    "lunch"
    t.text    "dinner"
    t.text    "snacks"
    t.integer "water_intake"
  end

  create_table "journals", force: :cascade do |t|
    t.string  "title"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

  create_table "week_planner", force: :cascade do |t|
    t.date "date"
    t.text "monday"
    t.text "tuesday"
    t.text "wednesday"
    t.text "thursday"
    t.text "friday"
    t.text "weekend"
  end

end
