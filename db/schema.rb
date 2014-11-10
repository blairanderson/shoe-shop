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

ActiveRecord::Schema.define(version: 20141105040816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.text     "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.integer  "impressions_count", default: 0
  end

  add_index "images", ["post_id"], name: "index_images_on_post_id", using: :btree

  create_table "keychains", force: true do |t|
    t.string   "api_secret"
    t.string   "api_token"
    t.string   "auth_credential_secret"
    t.string   "auth_credential_token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paypal_callbacks", force: true do |t|
    t.text     "response"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "payment_date"
    t.string   "payment_type"
    t.string   "payment_status"
    t.string   "payer_status"
    t.string   "payer_id"
    t.string   "payer_email"
    t.string   "payment_fee"
    t.string   "payment_gross"
    t.string   "handling_amount"
    t.string   "shipping"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_name"
    t.string   "address_status"
    t.string   "address_street"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip"
    t.string   "address_country_code"
    t.string   "address_country"
    t.string   "transaction_subject"
    t.string   "receiver_email"
    t.string   "receiver_id"
    t.string   "business"
    t.string   "protection_eligibility"
    t.string   "verify_sign"
    t.string   "ipn_track_id"
    t.string   "txn_id"
    t.string   "txn_type"
    t.string   "residence_country"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
    t.integer  "size_id"
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.integer  "images_count",       default: 0
    t.integer  "impressions_count",  default: 0
    t.integer  "price"
    t.integer  "status_enum",        default: 1
    t.integer  "scoreboard",         default: 0
  end

  add_index "posts", ["cached_votes_down"], name: "index_posts_on_cached_votes_down", using: :btree
  add_index "posts", ["cached_votes_score"], name: "index_posts_on_cached_votes_score", using: :btree
  add_index "posts", ["cached_votes_total"], name: "index_posts_on_cached_votes_total", using: :btree
  add_index "posts", ["cached_votes_up"], name: "index_posts_on_cached_votes_up", using: :btree
  add_index "posts", ["price"], name: "index_posts_on_price", using: :btree
  add_index "posts", ["scoreboard"], name: "index_posts_on_scoreboard", using: :btree
  add_index "posts", ["status_enum"], name: "index_posts_on_status_enum", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "sizes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "twitter"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
