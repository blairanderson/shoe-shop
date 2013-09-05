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

ActiveRecord::Schema.define(version: 20130905031206) do

  create_table "comments", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.text     "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "images", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.integer  "impressions_count", default: 0
  end

  add_index "images", ["post_id"], name: "index_images_on_post_id"

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

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
    t.string   "brand"
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
    t.integer  "status_enum",        default: 0
  end

  add_index "posts", ["cached_votes_down"], name: "index_posts_on_cached_votes_down"
  add_index "posts", ["cached_votes_score"], name: "index_posts_on_cached_votes_score"
  add_index "posts", ["cached_votes_total"], name: "index_posts_on_cached_votes_total"
  add_index "posts", ["cached_votes_up"], name: "index_posts_on_cached_votes_up"
  add_index "posts", ["price"], name: "index_posts_on_price"
  add_index "posts", ["status_enum"], name: "index_posts_on_status_enum"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "sizes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                        null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token"
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

  create_table "watched_items", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "watched_items", ["post_id"], name: "index_watched_items_on_post_id"
  add_index "watched_items", ["user_id"], name: "index_watched_items_on_user_id"

end
