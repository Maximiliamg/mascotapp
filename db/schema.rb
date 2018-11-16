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

ActiveRecord::Schema.define(version: 20180430083512) do

  create_table "blocked_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "blocked_quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blocked_users", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commments", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.string "commment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "origins", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.integer "postal_code"
    t.string "address"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_pictures", force: :cascade do |t|
    t.integer "picture_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "category"
    t.string "shipping_description"
    t.integer "origin_id"
    t.integer "user_id"
    t.integer "stock", default: 1
    t.float "price"
    t.boolean "is_used", default: false
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "seller_id"
    t.integer "buyer_id"
    t.integer "origin_id"
    t.integer "product_id"
    t.integer "quantity", default: 1
    t.float "total_price"
    t.integer "buyer_score"
    t.integer "seller_score"
    t.boolean "was_shipped", default: false
    t.boolean "was_delivered", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string "secret"
    t.date "expire_at"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean "company", default: false
    t.string "name"
    t.string "email"
    t.date "birthdate"
    t.integer "gender", default: 0
    t.string "username"
    t.string "password_digest"
    t.integer "role", default: 0
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
