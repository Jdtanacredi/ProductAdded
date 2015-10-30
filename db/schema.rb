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

ActiveRecord::Schema.define(version: 20151030192216) do

  create_table "addresses", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_line_1"
    t.string   "street_line_2"
    t.string   "city"
    t.string   "postal_code"
    t.string   "region"
    t.string   "country"
    t.string   "vat_number"
    t.string   "type"
    t.integer  "purchase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email_address", limit: 50
    t.string   "phone_number",  limit: 25
  end

  create_table "contests", force: true do |t|
    t.string   "email",      limit: 50
    t.string   "name",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "price",      limit: 2
    t.integer  "amount",     limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   limit: 2, default: 500
  end

  create_table "purchases", force: true do |t|
    t.integer  "product_id"
    t.string   "stripe_token"
    t.integer  "quantity"
    t.integer  "total_price_in_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["product_id"], name: "index_purchases_on_product_id"

end
