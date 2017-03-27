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

ActiveRecord::Schema.define(version: 20170302172513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "athletes", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "dob"
    t.string "grade"
    t.string "phone"
    t.string "address"
    t.string "sport"
    t.string "notes"
  end

  create_table "cures", force: :cascade do |t|
    t.integer  "treatment_id"
    t.integer  "taction_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "cures", ["taction_id"], name: "index_cures_on_taction_id", using: :btree
  add_index "cures", ["treatment_id"], name: "index_cures_on_treatment_id", using: :btree

  create_table "impresssions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "injuries", force: :cascade do |t|
    t.integer "athlete_id"
    t.string  "status"
    t.boolean "active"
    t.string  "injury_location"
    t.text    "tcomment"
    t.text    "comment"
    t.date    "date"
    t.string  "time"
  end

  add_index "injuries", ["athlete_id"], name: "index_injuries_on_athlete_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tactions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username",               default: "",    null: false
    t.string   "email"
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "trainers", ["reset_password_token"], name: "index_trainers_on_reset_password_token", unique: true, using: :btree
  add_index "trainers", ["username"], name: "index_trainers_on_username", unique: true, using: :btree

  create_table "treatments", force: :cascade do |t|
    t.integer "athlete_id"
    t.integer "trainer_id"
    t.string  "treatment_location"
    t.integer "taction_id"
    t.text    "comment"
    t.date    "date"
    t.string  "time"
  end

  add_index "treatments", ["athlete_id"], name: "index_treatments_on_athlete_id", using: :btree
  add_index "treatments", ["taction_id"], name: "index_treatments_on_taction_id", using: :btree
  add_index "treatments", ["trainer_id"], name: "index_treatments_on_trainer_id", using: :btree

end
