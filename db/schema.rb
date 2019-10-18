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

ActiveRecord::Schema.define(version: 2019_10_16_214748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kind_transactions", force: :cascade do |t|
    t.integer "kind"
    t.text "description"
    t.integer "nature"
    t.integer "signal"
  end

  create_table "stores", force: :cascade do |t|
    t.text "name"
    t.text "owner_name"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "kind_transaction_id"
    t.float "value"
    t.string "cpf"
    t.string "card"
    t.datetime "occurred_time"
    t.index ["kind_transaction_id"], name: "index_transactions_on_kind_transaction_id"
    t.index ["store_id"], name: "index_transactions_on_store_id"
  end

  add_foreign_key "transactions", "kind_transactions"
  add_foreign_key "transactions", "stores"
end
