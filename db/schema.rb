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

ActiveRecord::Schema.define(version: 20160912154734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arcade_games", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "arcade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arcade_id"], name: "index_arcade_games_on_arcade_id", using: :btree
    t.index ["game_id"], name: "index_arcade_games_on_game_id", using: :btree
  end

  create_table "arcades", force: :cascade do |t|
    t.string   "title"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.bigint   "phone_number"
    t.string   "website"
    t.string   "status"
    t.string   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.date     "last_in_arcade"
    t.integer  "times_played"
    t.string   "status"
    t.string   "purchase_url"
    t.text     "game_description"
    t.json     "key_map"
    t.string   "image"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.date     "date"
    t.string   "game_file"
    t.boolean  "liability",        default: false
    t.index ["user_id"], name: "index_games_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "fun"
    t.integer  "playability"
    t.integer  "difficulty"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.index ["game_id"], name: "index_reviews_on_game_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "tag_games", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_tag_games_on_game_id", using: :btree
    t.index ["tag_id"], name: "index_tag_games_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "company_name"
    t.string   "company_logo"
    t.string   "website"
    t.string   "twitter"
    t.boolean  "admin",                  default: false
    t.boolean  "approved_user",          default: false
    t.integer  "number_of_employees"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "image"
  end

  add_foreign_key "arcade_games", "arcades"
  add_foreign_key "arcade_games", "games"
  add_foreign_key "games", "users"
  add_foreign_key "reviews", "games"
  add_foreign_key "reviews", "users"
  add_foreign_key "tag_games", "games"
  add_foreign_key "tag_games", "tags"
end
