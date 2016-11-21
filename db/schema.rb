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

ActiveRecord::Schema.define(version: 20161121165855) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "approvals", force: true do |t|
    t.boolean  "approve"
    t.integer  "user_id"
    t.integer  "friendship_id"
    t.integer  "subscription_id"
    t.integer  "membership_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "approvals", ["friendship_id"], name: "index_approvals_on_friendship_id"
  add_index "approvals", ["membership_id"], name: "index_approvals_on_membership_id"
  add_index "approvals", ["subscription_id"], name: "index_approvals_on_subscription_id"
  add_index "approvals", ["user_id"], name: "index_approvals_on_user_id"

  create_table "contents", force: true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.integer  "post_id"
    t.integer  "presenter_id"
    t.integer  "friendship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["friendship_id"], name: "index_contents_on_friendship_id"
  add_index "contents", ["post_id"], name: "index_contents_on_post_id"
  add_index "contents", ["presenter_id"], name: "index_contents_on_presenter_id"
  add_index "contents", ["user_id"], name: "index_contents_on_user_id"

  create_table "feeds", force: true do |t|
    t.integer  "user_id"
    t.integer  "network_id"
    t.integer  "subscription_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feeds", ["network_id"], name: "index_feeds_on_network_id"
  add_index "feeds", ["subscription_id"], name: "index_feeds_on_subscription_id"
  add_index "feeds", ["user_id"], name: "index_feeds_on_user_id"

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "network_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["network_id"], name: "index_memberships_on_network_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "meta", force: true do |t|
    t.integer  "content_id"
    t.text     "data"
    t.integer  "user_id"
    t.integer  "approval_id"
    t.integer  "post_id"
    t.integer  "feed_id"
    t.integer  "presenter_id"
    t.integer  "friendship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meta", ["approval_id"], name: "index_meta_on_approval_id"
  add_index "meta", ["content_id"], name: "index_meta_on_content_id"
  add_index "meta", ["feed_id"], name: "index_meta_on_feed_id"
  add_index "meta", ["friendship_id"], name: "index_meta_on_friendship_id"
  add_index "meta", ["post_id"], name: "index_meta_on_post_id"
  add_index "meta", ["presenter_id"], name: "index_meta_on_presenter_id"
  add_index "meta", ["user_id"], name: "index_meta_on_user_id"

  create_table "networks", force: true do |t|
    t.integer  "user_id"
    t.boolean  "private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "networks", ["user_id"], name: "index_networks_on_user_id"

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.boolean  "private"
    t.integer  "feed_id"
    t.integer  "network_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["feed_id"], name: "index_posts_on_feed_id"
  add_index "posts", ["network_id"], name: "index_posts_on_network_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "presenters", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presenters", ["user_id"], name: "index_presenters_on_user_id"

  create_table "roles", force: true do |t|
    t.text     "powers"
    t.integer  "user_id"
    t.text     "meta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["user_id"], name: "index_roles_on_user_id"

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["feed_id"], name: "index_subscriptions_on_feed_id"
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "ui_elements", force: true do |t|
    t.text     "meta"
    t.integer  "user_id"
    t.integer  "presenter_id"
    t.integer  "content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ui_elements", ["content_id"], name: "index_ui_elements_on_content_id"
  add_index "ui_elements", ["presenter_id"], name: "index_ui_elements_on_presenter_id"
  add_index "ui_elements", ["user_id"], name: "index_ui_elements_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.integer  "friendship_id"
    t.integer  "role_id"
    t.integer  "presenter_id"
    t.integer  "approval_id"
    t.integer  "network_id"
  end

  add_index "users", ["approval_id"], name: "index_users_on_approval_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["friendship_id"], name: "index_users_on_friendship_id"
  add_index "users", ["network_id"], name: "index_users_on_network_id"
  add_index "users", ["presenter_id"], name: "index_users_on_presenter_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
