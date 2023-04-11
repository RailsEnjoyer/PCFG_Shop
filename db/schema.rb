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

ActiveRecord::Schema[7.0].define(version: 2023_04_11_115809) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.integer "user_id"
    t.text "country"
    t.text "brand"
    t.datetime "market_date"
    t.text "size"
    t.text "connectors"
    t.integer "guarantee"
    t.text "complete_set"
    t.float "rating"
    t.integer "weight"
    t.float "price"
    t.boolean "availability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["user_id"], name: "index_components_on_user_id"
  end

  create_table "coolers", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.float "price"
    t.string "socket"
    t.integer "fan_speed"
    t.integer "noise_level"
    t.integer "max_tdp"
    t.string "form_factor"
    t.float "rating"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cpus", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.float "price"
    t.string "socket"
    t.integer "core_count"
    t.integer "thread_count"
    t.float "base_clock"
    t.float "boost_clock"
    t.integer "tdp"
    t.string "compatible_socket"
    t.integer "cache"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rating"
    t.string "image"
    t.integer "memory_frequency"
  end

  create_table "gpus", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.float "price"
    t.integer "memory"
    t.float "core_clock"
    t.float "boost_clock"
    t.integer "tdp"
    t.string "memory_type"
    t.string "interface"
    t.string "compatible_interface"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.float "rating"
    t.integer "bus_width"
  end

  create_table "hdds", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "capacity"
    t.float "price"
    t.string "interface"
    t.string "form_factor"
    t.integer "rpm"
    t.string "compatible_interface"
    t.integer "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rating"
    t.string "image"
  end

  create_table "motherboards", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.float "price"
    t.string "chipset"
    t.string "form_factor"
    t.integer "memory_slots"
    t.integer "max_memory"
    t.string "memory_type"
    t.string "socket"
    t.string "compatible_cpu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rating"
    t.string "image"
    t.string "pci"
    t.integer "memory_clock"
  end

  create_table "pins", force: :cascade do |t|
    t.string "title"
    t.text "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "power_supplies", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "wattage"
    t.string "efficiency"
    t.float "price"
    t.string "form_factor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.float "rating"
  end

  create_table "rams", force: :cascade do |t|
    t.integer "memory"
    t.integer "memory_speed"
    t.string "brand"
    t.float "price"
    t.string "memory_type"
    t.integer "timings"
    t.float "voltage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "model"
    t.string "image"
    t.float "rating"
  end

  create_table "rigs", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.float "rating"
    t.string "image"
    t.string "form_factor"
    t.string "drive_bays"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ssds", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "capacity"
    t.float "price"
    t.string "interface"
    t.string "form_factor"
    t.integer "read_speed"
    t.integer "write_speed"
    t.string "compatible_interface"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rating"
    t.string "image"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
