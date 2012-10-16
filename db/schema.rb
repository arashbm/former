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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120814081322) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "fields", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "enabled"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "field_type"
    t.boolean  "optional"
  end

  create_table "fields_forms", :force => true do |t|
    t.integer "form_id"
    t.integer "field_id"
  end

  create_table "filled_fields", :force => true do |t|
    t.integer  "filled_form_id"
    t.integer  "field_id"
    t.text     "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "attached_file"
  end

  add_index "filled_fields", ["field_id"], :name => "index_filled_fields_on_field_id"
  add_index "filled_fields", ["filled_form_id"], :name => "index_filled_fields_on_filled_form_id"

  create_table "filled_forms", :force => true do |t|
    t.integer  "student_id"
    t.integer  "form_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "verified",            :default => "nil", :null => false
    t.string   "verification_status"
    t.string   "progress"
    t.string   "confirmed",           :default => "nil", :null => false
    t.string   "confirmation_status"
  end

  create_table "forms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "enabled"
  end

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "student_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "major"
    t.string   "minor"
    t.string   "father_name"
    t.string   "gender"
    t.string   "phone_number"
    t.string   "mobile_phone"
    t.string   "identification_number"
    t.string   "birth_date"
    t.string   "bylaw"
  end

  add_index "students", ["email"], :name => "index_students_on_email", :unique => true
  add_index "students", ["reset_password_token"], :name => "index_students_on_reset_password_token", :unique => true

end
