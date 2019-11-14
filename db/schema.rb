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

ActiveRecord::Schema.define(version: 2019_11_12_145953) do

  create_table "categories", force: :cascade do |t|
    t.string "category_name", limit: 50, null: false
  end

  create_table "food_controls", force: :cascade do |t|
    t.string "user_id"
    t.integer "food_id"
    t.datetime "start"
    t.datetime "end"
    t.integer "delete_flg"
    t.index ["food_id"], name: "index_food_controls_on_food_id"
    t.index ["user_id"], name: "index_food_controls_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.integer "category_id"
    t.string "food_name", limit: 30, null: false
    t.integer "day", null: false
    t.integer "food_delete_flg"
    t.index ["category_id"], name: "index_foods_on_category_id"
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "user_name", limit: 20, null: false
    t.string "password", limit: 20, null: false
    t.integer "user_delete_flg"
  end

end
