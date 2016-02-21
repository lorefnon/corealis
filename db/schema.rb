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

ActiveRecord::Schema.define(version: 20160221191307) do

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

  create_table "admin_users", force: :cascade do |t|
    t.string   "name"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "details"
    t.integer  "answerer_id"
    t.integer  "answerer_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "canonical"
    t.integer  "quiz_session_id"
  end

  create_table "applicants", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "quiz_sessions_count"
    t.decimal  "experience"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "invitor_id"
    t.integer  "invitee_id"
    t.integer  "quiz_id"
    t.datetime "valid_from"
    t.datetime "valid_till"
    t.datetime "duration"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  create_table "online_resource_applicant_associators", force: :cascade do |t|
    t.integer  "online_resource_id", null: false
    t.integer  "applicant_id",       null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "online_resource_providers", force: :cascade do |t|
    t.string   "root_url",   null: false
    t.string   "label",      null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "online_resources", force: :cascade do |t|
    t.string   "url",         null: false
    t.string   "category"
    t.integer  "provider_id", null: false
    t.string   "identity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "creator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "quiz_question_associators", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "quiz_id"
    t.integer  "associator_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "quiz_sessions", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "invitation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "interviewer_id"
    t.integer  "interviewee_id"
    t.datetime "started_at"
    t.datetime "expired_at"
    t.datetime "ended_at"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "title"
    t.integer  "creator_id"
    t.integer  "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "key"
    t.jsonb    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
