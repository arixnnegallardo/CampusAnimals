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

ActiveRecord::Schema.define(version: 2019_03_07_103711) do

  create_table "accounts", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animalprofiles", force: :cascade do |t|
    t.integer "animalID"
    t.integer "profileID"
    t.string "name"
    t.string "species"
    t.string "gender"
    t.string "color"
    t.text "markings"
    t.string "location"
    t.string "neutered"
    t.string "vaccinated"
    t.string "adopted"
    t.text "remarks"
    t.string "cagelabel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animalprofiless", primary_key: ["animalID", "profileID"], force: :cascade do |t|
    t.integer "animalID"
    t.integer "profileID"
    t.string "name", limit: 60
    t.string "species", limit: 30
    t.string "gender", limit: 8
    t.string "color", limit: 60
    t.text "markings"
    t.string "location", limit: 60
    t.string "neutered", limit: 4
    t.string "vaccinated", limit: 4
    t.string "adopted", limit: 4
    t.text "remarks"
    t.string "cagelabel", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "viewprofiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "xx", force: :cascade do |t|
    t.integer "animalID"
    t.integer "profileID"
    t.string "name", limit: 60
    t.string "species", limit: 30
    t.string "gender", limit: 8
    t.string "color", limit: 60
    t.text "markings"
    t.string "location", limit: 60
    t.string "neutered", limit: 4
    t.string "vaccinated", limit: 4
    t.string "adopted", limit: 4
    t.text "remarks"
    t.string "cagelabel", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
