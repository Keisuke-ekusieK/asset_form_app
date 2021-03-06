# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_27_103157) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "asset_allocations", force: :cascade do |t|
    t.integer "domestic_currency_deposits"
    t.integer "foreign_currency_deposits"
    t.integer "domestic_stocks"
    t.integer "foreign_stocks"
    t.integer "domestic_bonds"
    t.integer "foreign_bonds"
    t.integer "real_estate"
    t.integer "gold"
    t.integer "insurance"
    t.integer "others"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_asset_allocations_on_user_id"
  end

  create_table "families", force: :cascade do |t|
    t.boolean "spouse"
    t.integer "children"
    t.integer "parent"
    t.integer "worker"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spouse", "children", "parent", "worker"], name: "index_families_on_spouse_and_children_and_parent_and_worker"
    t.index ["user_id"], name: "index_families_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "monthly_expense_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["monthly_expense_id"], name: "index_likes_on_monthly_expense_id"
    t.index ["user_id", "monthly_expense_id"], name: "index_likes_on_user_id_and_monthly_expense_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "monthly_expenses", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.integer "house"
    t.integer "food"
    t.integer "clothes"
    t.integer "education"
    t.integer "daily_necessities"
    t.integer "car"
    t.integer "medical_treatment"
    t.integer "entertainment"
    t.integer "communication"
    t.integer "social"
    t.integer "insurance"
    t.text "comment"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "likes_count", default: 0, null: false
    t.index ["user_id"], name: "index_monthly_expenses_on_user_id"
    t.index ["year", "month", "user_id"], name: "index_monthly_expenses_on_year_and_month_and_user_id", unique: true
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "user_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "asset_allocations", "users"
  add_foreign_key "families", "users"
  add_foreign_key "monthly_expenses", "users"
end
