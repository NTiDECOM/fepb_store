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

ActiveRecord::Schema.define(version: 20151023124114) do

  create_table "products", force: :cascade do |t|
    t.string   "type",             limit: 255
    t.string   "title",            limit: 255
    t.decimal  "buy_price",                      precision: 10
    t.decimal  "sell_price",                     precision: 10
    t.string   "isbn",             limit: 255
    t.string   "author",           limit: 255
    t.string   "spiritual_author", limit: 255
    t.string   "publisher",        limit: 255
    t.integer  "year",             limit: 4
    t.integer  "pages_number",     limit: 4
    t.text     "synopisis",        limit: 65535
    t.date     "event_day"
    t.datetime "event_time"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "product_image",    limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "surname",                limit: 255
    t.string   "cpf",                    limit: 255
    t.string   "phone1",                 limit: 255
    t.string   "phone2",                 limit: 255
    t.string   "city",                   limit: 255
    t.string   "state",                  limit: 255
    t.string   "cep",                    limit: 255
    t.string   "street",                 limit: 255
    t.string   "street_number",          limit: 255
    t.string   "street_complement",      limit: 255
    t.boolean  "admin"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
