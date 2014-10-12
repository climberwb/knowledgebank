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

ActiveRecord::Schema.define(version: 20141012221213) do

  create_table "add_customer_to_users", force: true do |t|
    t.string   "customer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collaborations", force: true do |t|
    t.integer  "user_id"
    t.integer  "wiki_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collaborations", ["user_id"], name: "index_collaborations_on_user_id"
  add_index "collaborations", ["wiki_id"], name: "index_collaborations_on_wiki_id"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "wikis", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.boolean  "public",     default: true
  end

  add_index "wikis", ["user_id"], name: "index_wikis_on_user_id"

  create_table "wikis_users", force: true do |t|
    t.integer "users_id"
    t.integer "wikis_id"
    t.integer "collaborator"
    t.boolean "collaborators", default: true
  end

end
