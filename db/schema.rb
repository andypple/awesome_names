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

ActiveRecord::Schema.define(version: 2021_12_30_060752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "baby_names", force: :cascade do |t|
    t.citext "name"
    t.bigint "name_list_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name_list_id", "name"], name: "index_baby_names_on_name_list_id_and_name", unique: true
    t.index ["name_list_id"], name: "index_baby_names_on_name_list_id"
  end

  create_table "name_lists", force: :cascade do |t|
    t.string "uid", limit: 12, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "viewed_at", null: false
    t.index ["uid"], name: "index_name_lists_on_uid", unique: true
  end

end
