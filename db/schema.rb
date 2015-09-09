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

ActiveRecord::Schema.define(version: 20150829015224) do

  create_table "barang_keluar_barangs", force: :cascade do |t|
    t.integer  "barang_keluar_category_id", limit: 4
    t.integer  "barang_id",                 limit: 4
    t.integer  "unit_id",                   limit: 4
    t.string   "code",                      limit: 255
    t.string   "name",                      limit: 255
    t.text     "description",               limit: 65535
    t.decimal  "harga",                                   precision: 13, scale: 2, default: 0.0
    t.decimal  "min_bayar_po",                            precision: 13, scale: 2, default: 0.0
    t.datetime "created_at",                                                                     null: false
    t.datetime "updated_at",                                                                     null: false
  end

  add_index "barang_keluar_barangs", ["barang_id"], name: "index_barang_keluar_barangs_on_barang_id", using: :btree
  add_index "barang_keluar_barangs", ["barang_keluar_category_id"], name: "index_barang_keluar_barangs_on_barang_keluar_category_id", using: :btree
  add_index "barang_keluar_barangs", ["unit_id"], name: "index_barang_keluar_barangs_on_unit_id", using: :btree

  create_table "barang_keluar_categories", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "barang_keluar_pre_orders", force: :cascade do |t|
    t.integer  "barang_keluar_id", limit: 4
    t.datetime "pre_order_date"
    t.decimal  "bayar",                      precision: 13, scale: 2, default: 0.0
    t.decimal  "kembalian",                  precision: 13, scale: 2, default: 0.0
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
  end

  add_index "barang_keluar_pre_orders", ["barang_keluar_id"], name: "index_barang_keluar_pre_orders_on_barang_keluar_id", using: :btree

  create_table "barang_keluar_promos", force: :cascade do |t|
    t.integer  "barang_keluar_barang_id", limit: 4
    t.string   "name",                    limit: 255
    t.string   "description",             limit: 255
    t.integer  "threshold_qty",           limit: 4,                            default: 0
    t.decimal  "disc",                                precision: 13, scale: 2, default: 0.0
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
  end

  add_index "barang_keluar_promos", ["barang_keluar_barang_id"], name: "index_barang_keluar_promos_on_barang_keluar_barang_id", using: :btree

  create_table "barang_keluars", force: :cascade do |t|
    t.string   "no_transaksi", limit: 255
    t.datetime "tgl_keluar"
    t.decimal  "grand_total",              precision: 13, scale: 2, default: 0.0
    t.decimal  "pre_order",                precision: 13, scale: 2, default: 0.0
    t.decimal  "bayar",                    precision: 13, scale: 2, default: 0.0
    t.decimal  "kembalian",                precision: 13, scale: 2, default: 0.0
    t.string   "payment_type", limit: 255
    t.string   "state",        limit: 255
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  create_table "barang_masuks", force: :cascade do |t|
    t.integer  "barang_id",    limit: 4
    t.string   "no_transaksi", limit: 255
    t.integer  "jumlah",       limit: 4,     default: 0
    t.date     "tgl_masuk"
    t.text     "note",         limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "barang_masuks", ["barang_id"], name: "index_barang_masuks_on_barang_id", using: :btree

  create_table "barangs", force: :cascade do |t|
    t.integer  "category_id",                limit: 4
    t.integer  "unit_id",                    limit: 4
    t.string   "code",                       limit: 255
    t.string   "name",                       limit: 255
    t.text     "description",                limit: 65535
    t.decimal  "harga",                                    precision: 13, scale: 2, default: 0.0
    t.decimal  "min_bayar_po",                             precision: 13, scale: 2, default: 0.0
    t.datetime "created_at",                                                                      null: false
    t.datetime "updated_at",                                                                      null: false
    t.string   "gambar_barang_file_name",    limit: 255
    t.string   "gambar_barang_content_type", limit: 255
    t.integer  "gambar_barang_file_size",    limit: 4
    t.datetime "gambar_barang_updated_at"
  end

  add_index "barangs", ["category_id"], name: "index_barangs_on_category_id", using: :btree
  add_index "barangs", ["unit_id"], name: "index_barangs_on_unit_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "detail_barang_keluars", force: :cascade do |t|
    t.integer  "barang_keluar_id",        limit: 4
    t.integer  "barang_keluar_barang_id", limit: 4
    t.integer  "jumlah",                  limit: 4,                          default: 0
    t.decimal  "total_harga_awal",                  precision: 13, scale: 2, default: 0.0
    t.decimal  "total_harga",                       precision: 13, scale: 2, default: 0.0
    t.decimal  "pre_order",                         precision: 13, scale: 2, default: 0.0
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
  end

  add_index "detail_barang_keluars", ["barang_keluar_barang_id"], name: "index_detail_barang_keluars_on_barang_keluar_barang_id", using: :btree
  add_index "detail_barang_keluars", ["barang_keluar_id"], name: "index_detail_barang_keluars_on_barang_keluar_id", using: :btree

  create_table "promos", force: :cascade do |t|
    t.integer  "barang_id",     limit: 4
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.integer  "threshold_qty", limit: 4,                            default: 0
    t.decimal  "disc",                      precision: 13, scale: 2, default: 0.0
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  add_index "promos", ["barang_id"], name: "index_promos_on_barang_id", using: :btree

  create_table "stocks", force: :cascade do |t|
    t.integer  "barang_id",  limit: 4
    t.integer  "jumlah",     limit: 4, default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "stocks", ["barang_id"], name: "index_stocks_on_barang_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255, default: "",          null: false
    t.string   "last_name",              limit: 255, default: "",          null: false
    t.string   "email",                  limit: 255, default: "",          null: false
    t.string   "username",               limit: 255, default: "",          null: false
    t.string   "encrypted_password",     limit: 255, default: "",          null: false
    t.string   "role",                   limit: 255, default: "Anonymous", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
