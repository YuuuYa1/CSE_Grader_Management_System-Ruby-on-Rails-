# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_24_233404) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "term"
    t.string "title"
    t.string "shortDescription"
    t.string "component"
    t.string "subject"
    t.text "maxUnits"
    t.string "catalogNumber"
    t.string "academicCareer"
    t.string "catalogLevel"
    t.string "graderDemand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "catalogNumber"
    t.string "instructorDotName"
    t.string "studentDotName"
    t.string "section"
    t.string "knowledgeable"
    t.string "motivated"
    t.string "patient"
    t.string "overall"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forms", force: :cascade do |t|
    t.boolean "accept"
    t.boolean "deny"
    t.string "term"
    t.string "catalogNumber"
    t.string "campus"
    t.string "sectionNum"
    t.string "applicantId"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.string "createDate"
    t.string "freetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "catalogNumber"
    t.string "instructorDotName"
    t.string "studentDotName"
    t.text "comment"
    t.boolean "excellent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "catalogNumber"
    t.string "section"
    t.string "component"
    t.string "instructionMode"
    t.string "buildingDescription"
    t.string "startTime"
    t.string "endTime"
    t.string "startDate"
    t.string "endDate"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "sunday"
    t.string "instructors"
    t.string "graderDemand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.string "dotName"
    t.string "role"
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "display_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
