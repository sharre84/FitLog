ActiveRecord::Schema.define(version: 20160609231412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.integer  "sets"
    t.integer  "reps"
    t.integer  "workout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "exercises", ["workout_id"], name: "index_exercises_on_workout_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "date"
    t.string   "workout"
    t.string   "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.text     "comment"
  end

  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id", using: :btree

  add_foreign_key "exercises", "workouts"
  add_foreign_key "workouts", "users"
end
