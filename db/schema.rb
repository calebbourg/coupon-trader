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

ActiveRecord::Schema.define(version: 20180209173701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.float    "value",      default: 0.0, null: false
    t.integer  "brand_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["brand_id"], name: "index_coupons_on_brand_id", using: :btree
    t.index ["user_id"], name: "index_coupons_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "email",                         null: false
    t.string   "password_digest",               null: false
    t.float    "balance",         default: 0.0, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
