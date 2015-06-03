# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150603234256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "interests", force: true do |t|
    t.integer  "interested_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                                  null: false
    t.string   "email",                                 null: false
    t.string   "password_digest",                       null: false
    t.text     "address"
    t.string   "zipcode"
    t.string   "place"
    t.string   "contact"
    t.string   "other_contact"
    t.string   "site"
    t.integer  "nif"
    t.string   "professional_activity"
    t.text     "presentation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_birth"
    t.string   "identity_number"
    t.string   "cv"
    t.string   "professional_area"
    t.string   "scholarity"
    t.text     "education"
    t.string   "employment_status"
    t.text     "experience"
    t.string   "type"
    t.boolean  "backoffice",            default: false
  end

end
