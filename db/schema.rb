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

ActiveRecord::Schema.define(version: 20160311152114) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "last_name"
    t.string   "country"
    t.string   "city"
    t.string   "phone"
    t.string   "gender"
    t.integer  "role_id"
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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  add_index "admins", ["role_id"], name: "index_admins_on_role_id"

  create_table "bundles", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",                 precision: 10, scale: 2
    t.integer  "freelance_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "imghover_file_name"
    t.string   "imghover_content_type"
    t.integer  "imghover_file_size"
    t.datetime "imghover_updated_at"
  end

  add_index "bundles", ["freelance_id"], name: "index_bundles_on_freelance_id"

  create_table "bundles_services", id: false, force: :cascade do |t|
    t.integer "bundle_id"
    t.integer "service_id"
  end

  add_index "bundles_services", ["bundle_id"], name: "index_bundles_services_on_bundle_id"
  add_index "bundles_services", ["service_id"], name: "index_bundles_services_on_service_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "deliveries", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",       precision: 10, scale: 2
    t.text     "description"
    t.integer  "service_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "deliveries", ["service_id"], name: "index_deliveries_on_service_id"

  create_table "f_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "form_answers", ["form_id"], name: "index_form_answers_on_form_id"

  create_table "form_builds", force: :cascade do |t|
    t.string   "name"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "form_builds", ["service_id"], name: "index_form_builds_on_service_id"

  create_table "form_questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "form_build_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "form_questions", ["form_build_id"], name: "index_form_questions_on_form_build_id"

  create_table "forms", force: :cascade do |t|
    t.integer  "form_build_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "status_order_id"
  end

  add_index "forms", ["form_build_id"], name: "index_forms_on_form_build_id"
  add_index "forms", ["status_order_id"], name: "index_forms_on_status_order_id"

  create_table "freelances", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "last_name"
    t.string   "country"
    t.string   "city"
    t.string   "phone"
    t.string   "gender"
    t.string   "paypal"
    t.integer  "xp",                     default: 0
    t.integer  "f_role_id"
    t.integer  "level_id",               default: 1
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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "freelances", ["email"], name: "index_freelances_on_email", unique: true
  add_index "freelances", ["f_role_id"], name: "index_freelances_on_f_role_id"
  add_index "freelances", ["level_id"], name: "index_freelances_on_level_id"
  add_index "freelances", ["reset_password_token"], name: "index_freelances_on_reset_password_token", unique: true

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.integer  "xp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.boolean  "visibility"
    t.integer  "service_id"
    t.integer  "bundle_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "form_build_id"
  end

  add_index "pages", ["bundle_id"], name: "index_pages_on_bundle_id"
  add_index "pages", ["form_build_id"], name: "index_pages_on_form_build_id"
  add_index "pages", ["service_id"], name: "index_pages_on_service_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.decimal  "price",                 precision: 10, scale: 2
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "imghover_file_name"
    t.string   "imghover_content_type"
    t.integer  "imghover_file_size"
    t.datetime "imghover_updated_at"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "services", ["category_id"], name: "index_services_on_category_id"

  create_table "status_orders", force: :cascade do |t|
    t.string   "name"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wallets", force: :cascade do |t|
    t.decimal  "money",        precision: 10, scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "freelance_id"
  end

  add_index "wallets", ["freelance_id"], name: "index_wallets_on_freelance_id"

end
