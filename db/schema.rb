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

ActiveRecord::Schema.define(version: 20180717132016) do

  create_table "admin_users", force: :cascade do |t|
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
    t.integer  "authority",              default: 0
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cheerings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id", "review_id"], name: "index_comments_on_user_id_and_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "desired_menus", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_desired_menus_on_menu_id"
    t.index ["user_id", "menu_id"], name: "index_desired_menus_on_user_id_and_menu_id", unique: true
    t.index ["user_id"], name: "index_desired_menus_on_user_id"
  end

  create_table "eaten_menus", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_eaten_menus_on_menu_id"
    t.index ["user_id", "menu_id"], name: "index_eaten_menus_on_user_id_and_menu_id", unique: true
    t.index ["user_id"], name: "index_eaten_menus_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_likes_on_review_id"
    t.index ["user_id", "review_id"], name: "index_likes_on_user_id_and_review_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "name"
    t.integer  "price"
    t.integer  "status",       default: 0, null: false
    t.integer  "menu_type",    default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "prof_picture"
  end

  create_table "prefectures", force: :cascade do |t|
    t.integer  "prefecture_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
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
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "kana"
    t.integer  "tkg_flg",       default: 0, null: false
    t.integer  "prefecture_id", default: 0, null: false
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
    t.string   "provider"
    t.string   "uid"
    t.text     "tokens"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
