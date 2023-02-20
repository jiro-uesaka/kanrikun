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

ActiveRecord::Schema.define(version: 2023_02_17_055841) do

  create_table "items", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "name", null: false
    t.integer "price", default: 0, null: false
    t.string "status", null: false
    t.integer "stock", default: 0, null: false
    t.integer "order", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "item_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patterns", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "name", null: false
    t.integer "start_time", null: false
    t.integer "end_time", null: false
    t.integer "rest_time", null: false
    t.string "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "proceed", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "worker_id", null: false
    t.integer "day1", null: false
    t.integer "day2", null: false
    t.integer "day3", null: false
    t.integer "day4", null: false
    t.integer "day5", null: false
    t.integer "day6", null: false
    t.integer "day7", null: false
    t.integer "day8", null: false
    t.integer "day9", null: false
    t.integer "day10", null: false
    t.integer "day11", null: false
    t.integer "day12", null: false
    t.integer "day13", null: false
    t.integer "day14", null: false
    t.integer "day15", null: false
    t.integer "day16", null: false
    t.integer "day17", null: false
    t.integer "day18", null: false
    t.integer "day19", null: false
    t.integer "day20", null: false
    t.integer "day21", null: false
    t.integer "day22", null: false
    t.integer "day23", null: false
    t.integer "day24", null: false
    t.integer "day25", null: false
    t.integer "day26", null: false
    t.integer "day27", null: false
    t.integer "day28", null: false
    t.integer "day29", null: false
    t.integer "day30", null: false
    t.integer "day31", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_shops_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true
  end

  create_table "workers", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
