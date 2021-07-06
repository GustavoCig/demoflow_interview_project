# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_06_232032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "demos", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "presentations", force: :cascade do |t|
    t.bigint "demo_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["demo_id"], name: "index_presentations_on_demo_id"
  end

  create_table "slide_presentations", force: :cascade do |t|
    t.bigint "slide_id", null: false
    t.bigint "presentation_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["presentation_id"], name: "index_slide_presentations_on_presentation_id"
    t.index ["slide_id"], name: "index_slide_presentations_on_slide_id"
  end

  create_table "slides", force: :cascade do |t|
    t.string "type"
    t.bigint "demo_id", null: false
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active"], name: "index_slides_on_active"
    t.index ["demo_id"], name: "index_slides_on_demo_id"
    t.index ["type"], name: "index_slides_on_type"
  end

  add_foreign_key "presentations", "demos"
  add_foreign_key "slide_presentations", "presentations"
  add_foreign_key "slide_presentations", "slides"
  add_foreign_key "slides", "demos"
end
