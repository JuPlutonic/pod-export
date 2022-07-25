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

ActiveRecord::Schema[7.0].define(version: 2022_07_22_175240) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "budget_participants", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.string "tax_payer_id"
    t.boolean "status"
    t.string "budg_code"
    t.string "gov_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budg_code"], name: "index_budget_participants_on_budg_code", unique: true
    t.index ["gov_code"], name: "index_budget_participants_on_gov_code"
  end

  create_table "data", force: :cascade do |t|
    t.string "mime"
    t.date "date"
    t.boolean "converted"
    t.string "author"
    t.string "source"
    t.string "gov_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gov_code"], name: "index_data_on_gov_code"
  end

  create_table "json_datasets", force: :cascade do |t|
    t.binary "file"
    t.jsonb "jsonb", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "datum_id"
    t.index ["datum_id"], name: "index_json_datasets_on_datum_id"
  end

  create_table "pods", force: :cascade do |t|
    t.string "organization"
    t.string "tax_payer_id"
    t.uuid "pod_code", default: -> { "gen_random_uuid()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
    t.boolean "government_led", default: false
    t.index ["government_led"], name: "index_pods_on_government_led"
  end

  add_foreign_key "json_datasets", "data"
end
