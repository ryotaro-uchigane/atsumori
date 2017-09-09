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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170909025404) do

  create_table "documents", force: :cascade do |t|
    t.integer "event_id", null: false
    t.text "flie_name", null: false
    t.text "path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_documents_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.text "title", null: false
    t.text "description"
  end

  create_table "entrysheets", force: :cascade do |t|
    t.integer "user_id"
    t.text "name", null: false
    t.integer "age", null: false
    t.text "sex", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "email", null: false
    t.text "password", null: false
    t.text "role", null: false

    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
