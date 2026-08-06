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

ActiveRecord::Schema[8.1].define(version: 2026_07_29_171433) do
  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.decimal "price", precision: 8, scale: 2, null: false
    t.datetime "updated_at", null: false
  end

  create_table "quarters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "quarter_num", null: false
    t.datetime "updated_at", null: false
    t.integer "year", null: false
    t.index ["quarter_num", "year"], name: "index_quarters_on_quarter_num_and_year", unique: true
  end

  create_table "sales", force: :cascade do |t|
    t.integer "Product_id", null: false
    t.integer "Quarter_id", null: false
    t.datetime "created_at", null: false
    t.integer "quantity", null: false
    t.datetime "updated_at", null: false
    t.index ["Product_id"], name: "index_sales_on_Product_id"
    t.index ["Quarter_id"], name: "index_sales_on_Quarter_id"
  end

  add_foreign_key "sales", "Products"
  add_foreign_key "sales", "Quarters"
end
