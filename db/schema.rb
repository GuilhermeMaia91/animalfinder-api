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

ActiveRecord::Schema.define(version: 2020_05_22_131554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_founds", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.bigint "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_animal_founds_on_animal_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "age"
    t.string "extra_information"
    t.string "city"
    t.string "state"
    t.string "status"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_animals_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "celfone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "animal_founds", "animals"
  add_foreign_key "animals", "owners"
end
