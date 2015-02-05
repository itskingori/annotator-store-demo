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

ActiveRecord::Schema.define(version: 20150113115422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annotator_store_annotations", force: true do |t|
    t.string   "version"
    t.text     "text"
    t.text     "quote"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "annotator_store_image_annotations", force: true do |t|
    t.string "page_url"
    t.string "url"
    t.text   "text"
    t.string "shape"
    t.string "units"
    t.string "geometry"
  end

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

end
