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

ActiveRecord::Schema.define(version: 20150820053024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barang_keluar_barangs", force: :cascade do |t|
    t.integer  "barang_keluar_category_id"
    t.integer  "unit_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.float    "harga",                     default: 0.0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "barang_keluar_barangs", ["barang_keluar_category_id"], name: "index_barang_keluar_barangs_on_barang_keluar_category_id", using: :btree
  add_index "barang_keluar_barangs", ["unit_id"], name: "index_barang_keluar_barangs_on_unit_id", using: :btree

  create_table "barang_keluar_categories", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "barang_keluar_promos", force: :cascade do |t|
    t.integer  "barang_keluar_barang_id"
    t.string   "name"
    t.string   "description"
    t.integer  "threshold_qty"
    t.float    "disc",                    default: 0.0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "barang_keluar_promos", ["barang_keluar_barang_id"], name: "index_barang_keluar_promos_on_barang_keluar_barang_id", using: :btree

  create_table "barang_keluars", force: :cascade do |t|
    t.string   "no_transaksi"
    t.date     "tgl_keluar"
    t.float    "grand_total",  default: 0.0
    t.float    "bayar",        default: 0.0
    t.float    "kembalian",    default: 0.0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "barang_masuks", force: :cascade do |t|
    t.integer  "barang_id"
    t.string   "no_transaksi"
    t.integer  "jumlah",       default: 0
    t.date     "tgl_masuk"
    t.text     "note"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "barang_masuks", ["barang_id"], name: "index_barang_masuks_on_barang_id", using: :btree

  create_table "barangs", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "unit_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.float    "harga",       default: 0.0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "barangs", ["category_id"], name: "index_barangs_on_category_id", using: :btree
  add_index "barangs", ["unit_id"], name: "index_barangs_on_unit_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_barang_keluars", force: :cascade do |t|
    t.integer  "barang_keluar_id"
    t.integer  "barang_keluar_barang_id"
    t.integer  "jumlah",                  default: 0
    t.float    "total_harga",             default: 0.0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "detail_barang_keluars", ["barang_keluar_barang_id"], name: "index_detail_barang_keluars_on_barang_keluar_barang_id", using: :btree
  add_index "detail_barang_keluars", ["barang_keluar_id"], name: "index_detail_barang_keluars_on_barang_keluar_id", using: :btree

  create_table "promos", force: :cascade do |t|
    t.integer  "barang_id"
    t.string   "name"
    t.string   "description"
    t.integer  "threshold_qty"
    t.float    "disc"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "promos", ["barang_id"], name: "index_promos_on_barang_id", using: :btree

  create_table "stocks", force: :cascade do |t|
    t.integer  "barang_id"
    t.integer  "jumlah",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "stocks", ["barang_id"], name: "index_stocks_on_barang_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "",          null: false
    t.string   "last_name",              default: "",          null: false
    t.string   "email",                  default: "",          null: false
    t.string   "username",               default: "",          null: false
    t.string   "encrypted_password",     default: "",          null: false
    t.string   "role",                   default: "Anonymous", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
