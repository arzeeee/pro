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

ActiveRecord::Schema.define(version: 2018_12_21_145256) do

  create_table "answers", force: :cascade do |t|
    t.integer "problem_id"
    t.boolean "isCorrect?"
    t.string "textAnswer"
    t.index ["problem_id"], name: "index_answers_on_problem_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "categoryName"
  end

  create_table "cities", force: :cascade do |t|
    t.integer "province_id"
    t.string "cityName"
    t.string "timezone", default: "WIB"
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string "gradeName"
    t.string "gradeType"
  end

  create_table "lesson_items", force: :cascade do |t|
    t.integer "lesson_id"
    t.text "richtext"
    t.string "urlVideo"
    t.index ["lesson_id"], name: "index_lesson_items_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "lessonName"
    t.string "chapter"
    t.integer "price"
    t.string "lessonType"
    t.integer "subject_id"
    t.integer "grade_id"
    t.index ["grade_id"], name: "index_lessons_on_grade_id"
    t.index ["subject_id"], name: "index_lessons_on_subject_id"
  end

  create_table "logs", force: :cascade do |t|
    t.integer "user_id"
    t.string "action"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "major_interests", force: :cascade do |t|
    t.integer "code"
    t.string "majors"
    t.integer "university_id"
    t.integer "capacity"
    t.float "passingGrade"
    t.string "year"
    t.index ["university_id"], name: "index_major_interests_on_university_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "old_accounts", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "fullname"
    t.string "phoneNo"
    t.date "dob"
    t.string "school"
  end

  create_table "packages", force: :cascade do |t|
    t.string "packageItem"
    t.integer "price"
    t.text "packageDescription"
  end

  create_table "problems", force: :cascade do |t|
    t.integer "quiz_id"
    t.text "text"
    t.string "description"
    t.index ["quiz_id"], name: "index_problems_on_quiz_id"
  end

  create_table "promo_codes", force: :cascade do |t|
    t.text "promoDescription"
    t.date "expiryDate"
    t.integer "usedBy"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "provinceName"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "category_id"
    t.datetime "time"
    t.index ["category_id"], name: "index_quizzes_on_category_id"
    t.index ["lesson_id"], name: "index_quizzes_on_lesson_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "roleName"
  end

  create_table "schools", force: :cascade do |t|
    t.integer "city_id"
    t.string "schoolName"
    t.index ["city_id"], name: "index_schools_on_city_id"
  end

  create_table "students", force: :cascade do |t|
    t.date "dob"
    t.integer "school_id"
    t.integer "province_id"
    t.string "nise"
    t.integer "university_id"
    t.integer "major_interest_id"
    t.integer "grade_id"
    t.boolean "is_edulab", default: false
    t.string "referredBy", default: "-"
    t.index ["grade_id"], name: "index_students_on_grade_id"
    t.index ["major_interest_id"], name: "index_students_on_major_interest_id"
    t.index ["province_id"], name: "index_students_on_province_id"
    t.index ["school_id"], name: "index_students_on_school_id"
    t.index ["university_id"], name: "index_students_on_university_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subjectName"
  end

  create_table "teacher_roles", force: :cascade do |t|
    t.string "role"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "balance"
    t.string "address"
    t.date "dob"
    t.string "university"
    t.float "gpa"
  end

  create_table "transaction_histories", force: :cascade do |t|
    t.integer "package_id"
    t.integer "amountPaid"
    t.integer "paymentType"
    t.integer "transaction_statuses_id"
    t.index ["package_id"], name: "index_transaction_histories_on_package_id"
    t.index ["transaction_statuses_id"], name: "index_transaction_histories_on_transaction_statuses_id"
  end

  create_table "transaction_statuses", force: :cascade do |t|
    t.string "statusOfTransaction"
  end

  create_table "universities", force: :cascade do |t|
    t.string "universityName"
  end

  create_table "user_lessons", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "user_id"
    t.index ["lesson_id"], name: "index_user_lessons_on_lesson_id"
    t.index ["user_id"], name: "index_user_lessons_on_user_id"
  end

  create_table "user_promo_codes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "promo_code_id"
    t.index ["promo_code_id"], name: "index_user_promo_codes_on_promo_code_id"
    t.index ["user_id"], name: "index_user_promo_codes_on_user_id"
  end

  create_table "user_quizzes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quiz_id"
    t.index ["quiz_id"], name: "index_user_quizzes_on_quiz_id"
    t.index ["user_id"], name: "index_user_quizzes_on_user_id"
  end

  create_table "user_students", force: :cascade do |t|
    t.integer "user_id"
    t.integer "student_id"
    t.integer "balance", default: 5000
    t.integer "point", default: 0
    t.index ["student_id"], name: "index_user_students_on_student_id"
    t.index ["user_id"], name: "index_user_students_on_user_id"
  end

  create_table "user_teachers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "teacher_detail_id"
    t.integer "teacher_role_id"
    t.index ["teacher_detail_id"], name: "index_user_teachers_on_teacher_detail_id"
    t.index ["teacher_role_id"], name: "index_user_teachers_on_teacher_role_id"
    t.index ["user_id"], name: "index_user_teachers_on_user_id"
  end

  create_table "user_transactions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "transaction_id"
    t.index ["transaction_id"], name: "index_user_transactions_on_transaction_id"
    t.index ["user_id"], name: "index_user_transactions_on_user_id"
  end

  create_table "user_verifieds", force: :cascade do |t|
    t.integer "user_id"
    t.integer "codeGenerated"
    t.integer "codeVerified"
    t.boolean "isVerified?"
    t.index ["user_id"], name: "index_user_verifieds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", null: false
    t.string "password_digest"
    t.string "fullname"
    t.string "phoneNo"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
