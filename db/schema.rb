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

ActiveRecord::Schema.define(version: 20151023231221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text    "body",      null: false
    t.integer "author_id", null: false
    t.integer "media_id",  null: false
  end

  create_table "followers", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followee_id", null: false
  end

  add_index "followers", ["follower_id", "followee_id"], name: "index_followers_on_follower_id_and_followee_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer "media_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "likes", ["media_id", "user_id"], name: "index_likes_on_media_id_and_user_id", using: :btree

  create_table "media", force: :cascade do |t|
    t.string  "title",       null: false
    t.string  "description", null: false
    t.integer "author_id",   null: false
  end

  add_index "media", ["author_id"], name: "index_media_on_author_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.text    "url",            null: false
    t.string  "thumb_url"
    t.integer "imageable_id"
    t.string  "imageable_type"
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "username",        null: false
    t.string "session_token",   null: false
    t.string "password_digest", null: false
    t.string "quote",           null: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
