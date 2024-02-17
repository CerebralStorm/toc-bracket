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

ActiveRecord::Schema[7.1].define(version: 2024_02_17_051942) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brackets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "league_id"
    t.integer "template_bracket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chefs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "league_users", force: :cascade do |t|
    t.integer "league_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchup_chefs", force: :cascade do |t|
    t.integer "matchup_id"
    t.integer "chef_id"
    t.integer "seed"
    t.integer "integer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchup_selections", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bracket_id"
    t.integer "matchup_id"
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "score"
  end

  create_table "matchups", force: :cascade do |t|
    t.integer "template_bracket_id"
    t.integer "winner_id"
    t.integer "parent_id"
    t.integer "round_number"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_brackets", force: :cascade do |t|
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
