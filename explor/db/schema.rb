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

ActiveRecord::Schema.define(version: 20151120233942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.text     "categories"
    t.string   "title"
    t.integer  "user_id"
    t.integer  "location_id"
    t.text     "img"
    t.text     "vicinity"
    t.text     "place_id"
    t.integer  "price_level"
    t.float    "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "favorites", ["location_id"], name: "index_favorites_on_location_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.text     "img"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations_users", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations_users", ["location_id"], name: "index_locations_users_on_location_id", using: :btree
  add_index "locations_users", ["user_id"], name: "index_locations_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "favorites", "locations"
  add_foreign_key "favorites", "users"
  add_foreign_key "locations_users", "locations"
  add_foreign_key "locations_users", "users"
end
