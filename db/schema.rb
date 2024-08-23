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

ActiveRecord::Schema[7.2].define(version: 2024_08_23_182542) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_packs", force: :cascade do |t|
    t.string "name"
    t.bigint "protein_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["protein_id"], name: "index_food_packs_on_protein_id"
  end

  create_table "foods_sides", id: false, force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "side_id", null: false
    t.index ["food_id", "side_id"], name: "index_foods_sides_on_food_id_and_side_id"
    t.index ["side_id", "food_id"], name: "index_foods_sides_on_side_id_and_food_id"
  end

  create_table "proteins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sides", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token", unique: true
  end

  add_foreign_key "food_packs", "proteins"
end
