# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160726203749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.decimal  "buy_price"
    t.decimal  "sell_price"
    t.string   "isbn"
    t.string   "author"
    t.string   "spiritual_author"
    t.string   "publisher"
    t.integer  "year"
    t.integer  "pages_number"
    t.text     "synopisis"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "product_image"
    t.boolean  "active"
    t.integer  "quantity",         default: 0
    t.datetime "event_datetime"
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "product_id"
    t.integer  "product_quantity"
    t.decimal  "unit_price",       precision: 12, scale: 3
    t.decimal  "total_price",      precision: 12, scale: 3
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "sale_items", ["product_id"], name: "index_sale_items_on_product_id", using: :btree
  add_index "sale_items", ["sale_id"], name: "index_sale_items_on_sale_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "buyer_name"
    t.decimal  "subtotal",    precision: 12, scale: 3
    t.decimal  "total",       precision: 12, scale: 3
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "status",                               default: 0
    t.string   "seller_name"
  end

  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "cpf"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "city"
    t.string   "state"
    t.string   "cep"
    t.string   "street"
    t.string   "street_number"
    t.string   "street_complement"
    t.boolean  "admin"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
    t.string   "neighborhood"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "sales", "users"
end
