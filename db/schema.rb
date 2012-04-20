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

ActiveRecord::Schema.define(:version => 20120420040831) do

  create_table "advertisements", :force => true do |t|
    t.string   "domain"
    t.string   "pagename"
    t.string   "seqnum"
    t.string   "tagname"
    t.string   "display_type"
    t.string   "beizhu"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "clicks", :force => true do |t|
    t.string  "tagname"
    t.integer "clicks"
    t.date    "record_date"
  end

  create_table "results", :force => true do |t|
    t.integer  "words_score1"
    t.integer  "words_score2"
    t.integer  "words_score3"
    t.integer  "words_score4"
    t.integer  "listen_score1"
    t.integer  "listen_words_score1"
    t.integer  "write_score1"
    t.integer  "write_words_score1"
    t.integer  "read_score1"
    t.integer  "read_words_score1"
    t.integer  "spoken_score1"
    t.integer  "spoken_words_score1"
    t.datetime "result_date"
    t.integer  "jpm_id"
    t.integer  "student_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "remark"
    t.integer  "exception_type"
    t.integer  "has_exception"
  end

  create_table "student_timelines", :force => true do |t|
    t.datetime "arrival_time"
    t.datetime "leave_time"
    t.integer  "action_type_1"
    t.string   "action_spec_1"
    t.integer  "location_type_1"
    t.integer  "action_type_2"
    t.string   "action_spec_2"
    t.integer  "location_type_2"
    t.integer  "action_type_3"
    t.string   "action_spec_3"
    t.integer  "location_type_3"
    t.integer  "action_type_4"
    t.string   "action_spec_4"
    t.integer  "location_type_4"
    t.integer  "action_type_5"
    t.string   "action_spec_5"
    t.integer  "location_type_5"
    t.string   "remarks"
    t.integer  "jpm_id"
    t.integer  "student_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",                  :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "name"
    t.boolean  "admin",                               :default => false
    t.integer  "role",                   :limit => 3, :default => 0
    t.integer  "jpm_id"
    t.integer  "spm_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
