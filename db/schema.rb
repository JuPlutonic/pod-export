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

ActiveRecord::Schema.define(version: 20_191_017_192_104) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data", force: :cascade do |t|
    t.string "mime"
    t.date "date"
    t.boolean "converted"
    t.string "author"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pod_id"
    t.index ["pod_id"], name: "index_data_on_pod_id"
  end

  create_table "json_datasets", force: :cascade do |t|
    t.binary "file"
    t.jsonb "jsonb", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "datum_id"
    t.index ["datum_id"], name: "index_json_datasets_on_datum_id"
  end

  create_table "pods", force: :cascade do |t|
    t.string "organization"
    t.string "tax_payer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "data", "pods"
  add_foreign_key "json_datasets", "data"
end
