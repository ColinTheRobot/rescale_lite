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

ActiveRecord::Schema[7.1].define(version: 2024_05_20_155707) do
  create_table "ingredients", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.string "name"
    t.decimal "quantity"
    t.integer "units"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "question_answers", force: :cascade do |t|
    t.integer "coman_id", null: false
    t.integer "brand_id"
    t.text "question"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_question_answers_on_brand_id"
    t.index ["coman_id"], name: "index_question_answers_on_coman_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "time_to_prepare_in_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "company"
    t.boolean "is_brand", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingredients", "recipes"
  add_foreign_key "question_answers", "users", column: "brand_id"
  add_foreign_key "question_answers", "users", column: "coman_id"
end
