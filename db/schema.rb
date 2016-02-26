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

ActiveRecord::Schema.define(version: 20160221195508) do

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
    t.integer  "question_id",     null: false
    t.text     "details"
    t.integer  "answerer_id",     null: false
    t.integer  "answerer_type",   null: false
    t.integer  "quiz_session_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "canonical"
  end

  add_index "answers", ["question_id", "answerer_id", "answerer_type"], name: "index_answers_on_question_id_and_answerer_id_and_answerer_type", using: :btree
  add_index "answers", ["question_id", "canonical"], name: "index_answers_on_question_id_and_canonical", using: :btree
  add_index "answers", ["quiz_session_id", "question_id"], name: "index_answers_on_quiz_session_id_and_question_id", using: :btree

  create_table "applicants", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "quiz_sessions_count"
    t.decimal  "experience"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "applicants", ["creator_id"], name: "index_applicants_on_creator_id", using: :btree
  add_index "applicants", ["email"], name: "index_applicants_on_email", unique: true, using: :btree
  add_index "applicants", ["experience"], name: "index_applicants_on_experience", using: :btree
  add_index "applicants", ["phone_number"], name: "index_applicants_on_phone_number", using: :btree
  add_index "applicants", ["username"], name: "index_applicants_on_username", unique: true, using: :btree

  create_table "invitations", force: :cascade do |t|
    t.integer  "invitor_id",             null: false
    t.integer  "invitee_id",             null: false
    t.integer  "quiz_id",                null: false
    t.integer  "status",     default: 0
    t.datetime "valid_from"
    t.datetime "valid_till"
    t.integer  "duration"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "invitations", ["id", "status"], name: "index_invitations_on_id_and_status", using: :btree
  add_index "invitations", ["id", "valid_from", "valid_till"], name: "index_invitations_on_id_and_valid_from_and_valid_till", using: :btree
  add_index "invitations", ["quiz_id"], name: "index_invitations_on_quiz_id", using: :btree

  create_table "online_resource_applicant_associators", force: :cascade do |t|
    t.integer  "online_resource_id", null: false
    t.integer  "applicant_id",       null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "online_resource_applicant_associators", ["applicant_id", "online_resource_id"], name: "index_oraa_a_id_o_r_id", using: :btree

  create_table "online_resource_providers", force: :cascade do |t|
    t.string   "root_url",   null: false
    t.string   "label",      null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "online_resource_providers", ["label"], name: "index_online_resource_providers_on_label", unique: true, using: :btree

  create_table "online_resources", force: :cascade do |t|
    t.string   "url",         null: false
    t.string   "category"
    t.integer  "provider_id", null: false
    t.string   "identity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "online_resources", ["category"], name: "index_online_resources_on_category", using: :btree
  add_index "online_resources", ["provider_id"], name: "index_online_resources_on_provider_id", using: :btree

  create_table "que_jobs", id: false, force: :cascade do |t|
    t.integer  "priority",    limit: 2, default: 100,                                        null: false
    t.datetime "run_at",                default: "now()",                                    null: false
    t.integer  "job_id",      limit: 8, default: "nextval('que_jobs_job_id_seq'::regclass)", null: false
    t.text     "job_class",                                                                  null: false
    t.json     "args",                  default: [],                                         null: false
    t.integer  "error_count",           default: 0,                                          null: false
    t.text     "last_error"
    t.text     "queue",                 default: "",                                         null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.integer  "creator_id",  null: false
    t.string   "slug",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["slug"], name: "index_questions_on_slug", unique: true, using: :btree

  create_table "quiz_question_associators", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "quiz_id"
    t.integer  "associator_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "quiz_question_associators", ["quiz_id", "question_id"], name: "index_quiz_question_associators_on_quiz_id_and_question_id", using: :btree

  create_table "quiz_sessions", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "invitation_id"
    t.integer  "interviewee_id"
    t.integer  "interviewer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "started_at"
    t.datetime "expired_at"
    t.datetime "ended_at"
  end

  add_index "quiz_sessions", ["interviewee_id"], name: "index_quiz_sessions_on_interviewee_id", using: :btree
  add_index "quiz_sessions", ["interviewer_id", "interviewee_id"], name: "index_quiz_sessions_on_interviewer_id_and_interviewee_id", using: :btree
  add_index "quiz_sessions", ["invitation_id", "quiz_id"], name: "index_quiz_sessions_on_invitation_id_and_quiz_id", using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "creator_id", null: false
    t.integer  "duration"
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "quizzes", ["creator_id", "slug"], name: "index_quizzes_on_creator_id_and_slug", using: :btree
  add_index "quizzes", ["slug"], name: "index_quizzes_on_slug", unique: true, using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "key",        null: false
    t.jsonb    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "settings", ["key"], name: "index_settings_on_key", unique: true, using: :btree

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
