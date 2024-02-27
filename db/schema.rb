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

ActiveRecord::Schema[7.1].define(version: 2024_02_27_200625) do
  create_table "build_computers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "builders", force: :cascade do |t|
    t.integer "clientName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "component_attributes", force: :cascade do |t|
    t.string "brand"
    t.string "cpuSupport"
    t.integer "memorySlot"
    t.integer "memoryLimit"
    t.boolean "video"
    t.boolean "isGPU"
    t.integer "memory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "component_validations", force: :cascade do |t|
    t.string "componentType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "component_attribute_id", null: false
    t.index ["component_attribute_id"], name: "index_component_validations_on_component_attribute_id"
  end

  create_table "components", force: :cascade do |t|
    t.string "componentName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "component_validation_id", null: false
    t.index ["component_validation_id"], name: "index_components_on_component_validation_id"
  end

  add_foreign_key "component_validations", "component_attributes"
  add_foreign_key "components", "component_validations"
end
