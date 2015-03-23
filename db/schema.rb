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

ActiveRecord::Schema.define(version: 20150323120127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annotator_store_annotations", force: true do |t|
    t.string   "version"
    t.text     "text"
    t.text     "quote"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user",                     null: false
    t.json     "permissions",              null: false
    t.string   "upvotes",     default: [], null: false, array: true
  end

  add_index "annotator_store_annotations", ["upvotes"], name: "index_annotator_store_annotations_on_upvotes", using: :gin

  create_table "annotator_store_image_annotations", force: true do |t|
    t.string "page_url"
    t.string "url"
    t.text   "text"
    t.string "shape"
    t.string "units"
    t.string "geometry"
    t.string "user",                     null: false
    t.json   "permissions",              null: false
    t.string "upvotes",     default: [], null: false, array: true
  end

  add_index "annotator_store_image_annotations", ["upvotes"], name: "index_annotator_store_image_annotations_on_upvotes", using: :gin

  create_table "annotator_store_ranges", force: true do |t|
    t.integer  "annotation_id"
    t.string   "start"
    t.string   "end"
    t.integer  "start_offset"
    t.integer  "end_offset"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "annotator_store_ranges", ["annotation_id"], name: "index_annotator_store_ranges_on_annotation_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "gamified",                            null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
