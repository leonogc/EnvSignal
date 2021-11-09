# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_09_221547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorities", force: :cascade do |t|
    t.integer "identifier"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "markers", force: :cascade do |t|
    t.string "disaster_type"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "obs"
    t.bigint "user_id", null: false
    t.boolean "verified", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_markers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.date "birth_date"
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "voters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "marker_id", null: false
    t.integer "vote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["marker_id"], name: "index_voters_on_marker_id"
    t.index ["user_id"], name: "index_voters_on_user_id"
  end

  add_foreign_key "markers", "users"
  add_foreign_key "voters", "markers"
  add_foreign_key "voters", "users"
end
