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

ActiveRecord::Schema.define(version: 20180625101505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string "eduName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recuitor_profiles", force: :cascade do |t|
    t.string "company_name"
    t.string "contact_no"
    t.string "address"
    t.string "pan_no"
    t.string "description"
    t.bigint "recuitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recuitor_id"], name: "index_recuitor_profiles_on_recuitor_id"
  end

  create_table "recuitors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_recuitors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_recuitors_on_reset_password_token", unique: true
  end

  create_table "seeker_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "seeker_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_seeker_categories_on_category_id"
    t.index ["seeker_profile_id"], name: "index_seeker_categories_on_seeker_profile_id"
  end

  create_table "seeker_educations", force: :cascade do |t|
    t.bigint "education_id"
    t.bigint "seeker_profile_id"
    t.string "colzname"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["education_id"], name: "index_seeker_educations_on_education_id"
    t.index ["seeker_profile_id"], name: "index_seeker_educations_on_seeker_profile_id"
  end

  create_table "seeker_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_no"
    t.string "sex"
    t.string "prefered_loc"
    t.integer "salary"
    t.string "dob"
    t.string "nationality"
    t.string "perm_address"
    t.string "temp_address"
    t.string "experience"
    t.string "description"
    t.string "location"
    t.boolean "job_status"
    t.string "certificate"
    t.bigint "seeker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seeker_id"], name: "index_seeker_profiles_on_seeker_id"
  end

  create_table "seeker_skills", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "seeker_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seeker_category_id"], name: "index_seeker_skills_on_seeker_category_id"
    t.index ["skill_id"], name: "index_seeker_skills_on_skill_id"
  end

  create_table "seekers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_seekers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_seekers_on_reset_password_token", unique: true
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
