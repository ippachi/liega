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

ActiveRecord::Schema[7.0].define(version: 2023_02_18_164727) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_project_members", force: :cascade do |t|
    t.bigint "project_member_id", null: false
    t.index ["project_member_id"], name: "index_active_project_members_on_project_member_id", unique: true
  end

  create_table "backlogs", id: :string, force: :cascade do |t|
    t.string "project_id", null: false
    t.integer "lock_version", default: 0, null: false
    t.index ["project_id"], name: "index_backlogs_on_project_id", unique: true
  end

  create_table "developer_users", id: :string, force: :cascade do |t|
    t.string "user_id"
    t.index ["user_id"], name: "index_developer_users_on_user_id", unique: true
  end

  create_table "issues", id: :string, force: :cascade do |t|
    t.string "backlog_id", null: false
    t.string "summary", null: false
    t.integer "lock_version", default: 0, null: false
    t.index ["backlog_id"], name: "index_issues_on_backlog_id"
  end

  create_table "project_members", force: :cascade do |t|
    t.string "user_id", null: false
    t.string "project_id", null: false
    t.string "role", null: false
    t.index ["project_id"], name: "index_project_members_on_project_id"
    t.index ["user_id", "project_id"], name: "index_project_members_on_user_id_and_project_id", unique: true
    t.index ["user_id"], name: "index_project_members_on_user_id"
  end

  create_table "projects", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.integer "lock_version", default: 0, null: false
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.integer "lock_version", default: 0, null: false
  end

  add_foreign_key "active_project_members", "project_members"
  add_foreign_key "backlogs", "projects"
  add_foreign_key "developer_users", "users"
  add_foreign_key "issues", "backlogs"
  add_foreign_key "project_members", "projects"
  add_foreign_key "project_members", "users"
end
