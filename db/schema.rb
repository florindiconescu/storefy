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

ActiveRecord::Schema.define(version: 2019_05_22_105858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "total_price"
    t.string "status"
    t.bigint "user_id"
    t.bigint "storage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storage_id"], name: "index_bookings_on_storage_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "data"
    t.bigint "storage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storage_id"], name: "index_photos_on_storage_id"
  end

  create_table "storages", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "sqm"
    t.string "address"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "longitude"
    t.float "latitude"
    t.boolean "active", default: true
    t.index ["user_id"], name: "index_storages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "owner", default: false
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "storages"
  add_foreign_key "bookings", "users"
  add_foreign_key "photos", "storages"
  add_foreign_key "storages", "users"
end
