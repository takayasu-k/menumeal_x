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

ActiveRecord::Schema.define(version: 20170923073133) do

  create_table "menus", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "name"
    t.integer  "price"
    t.integer  "status",     default: 0, null: false
    t.integer  "menu_type",  default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "menu_id"
    t.string   "picture"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_details", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "access"
    t.string   "parking"
    t.string   "operating_hours"
    t.string   "budget"
    t.string   "payment"
    t.integer  "seats"
    t.string   "private_room"
    t.string   "smoking"
    t.string   "bar"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "holiday"
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "tel"
    t.string   "prof_picture"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "kana"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "profile"
    t.date     "birthday"
    t.integer  "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "prof_picture"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
