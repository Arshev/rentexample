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

ActiveRecord::Schema.define(version: 20161119075623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_conditions", force: :cascade do |t|
    t.string "description"
  end

  create_table "car_statuses", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string  "brand",        null: false
    t.integer "price",        null: false
    t.integer "status_id",    null: false
    t.integer "condition_id", null: false
    t.index ["condition_id"], name: "index_cars_on_condition_id", using: :btree
    t.index ["status_id"], name: "index_cars_on_status_id", using: :btree
  end

  create_table "fines", force: :cascade do |t|
    t.string  "reason",   null: false
    t.integer "cost",     null: false
    t.integer "order_id"
    t.index ["order_id"], name: "index_fines_on_order_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "rent_time", null: false
    t.string  "passport",  null: false
    t.string  "comment"
    t.integer "car_id",    null: false
    t.integer "client_id", null: false
    t.integer "admin_id",  null: false
    t.integer "status_id", null: false
    t.index ["admin_id"], name: "index_orders_on_admin_id", using: :btree
    t.index ["car_id"], name: "index_orders_on_car_id", using: :btree
    t.index ["client_id"], name: "index_orders_on_client_id", using: :btree
    t.index ["status_id"], name: "index_orders_on_status_id", using: :btree
  end

  create_table "rent_users", force: :cascade do |t|
    t.string  "name",     null: false
    t.string  "email",    null: false
    t.string  "password", null: false
    t.integer "role_id"
    t.index ["role_id"], name: "index_rent_users_on_role_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

  add_foreign_key "cars", "car_conditions", column: "condition_id"
  add_foreign_key "cars", "car_statuses", column: "status_id"
  add_foreign_key "fines", "orders"
  add_foreign_key "orders", "cars"
  add_foreign_key "orders", "order_statuses", column: "status_id"
  add_foreign_key "orders", "rent_users", column: "admin_id"
  add_foreign_key "orders", "rent_users", column: "client_id"
  add_foreign_key "rent_users", "roles"
end
