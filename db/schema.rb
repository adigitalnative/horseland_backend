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

ActiveRecord::Schema.define(version: 2018_12_01_003624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horses", force: :cascade do |t|
    t.string "name", default: "untitled", null: false
    t.bigint "breed_id"
    t.string "color"
    t.integer "age", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "for_sale", default: false, null: false
    t.bigint "player_id"
    t.string "gender"
    t.string "image_url"
    t.integer "sale_price", default: 1000, null: false
    t.index ["breed_id"], name: "index_horses_on_breed_id"
    t.index ["player_id"], name: "index_horses_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "balance_cents", default: 0, null: false
    t.string "balance_currency", default: "USD", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "player_id"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "withdrawal", default: false, null: false
    t.index ["player_id"], name: "index_transactions_on_player_id"
  end

  add_foreign_key "horses", "breeds"
  add_foreign_key "horses", "players"
  add_foreign_key "transactions", "players"
end
