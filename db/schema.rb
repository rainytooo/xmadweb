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

ActiveRecord::Schema.define(:version => 20120811052314) do

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

  create_table "course_contents", :force => true do |t|
    t.datetime "plan_date"
    t.integer  "course_num"
    t.integer  "action_type"
    t.integer  "lesson_id"
    t.integer  "teaching_material_id"
    t.integer  "spm_id"
    t.integer  "student_id"
    t.integer  "dairy_plan_id"
    t.integer  "word_material_id"
    t.integer  "word_counts"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "teacher_id"
    t.string   "notes"
  end

  create_table "dairy_plans", :force => true do |t|
    t.datetime "plan_date"
    t.integer  "spm_id"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "notes"
    t.integer  "plantype"
  end

  create_table "exam_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "exams", :force => true do |t|
    t.integer  "paper_id"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "set_time"
    t.integer  "user_id"
    t.integer  "status"
  end

  create_table "ext_attributes", :force => true do |t|
    t.integer  "student_id"
    t.integer  "total_class_count"
    t.integer  "listen_course_count"
    t.integer  "read_course_count"
    t.integer  "write_course_count"
    t.integer  "speak_course_count"
    t.integer  "completion_course_count"
    t.integer  "syntax_course_count"
    t.integer  "listen_teacher_id"
    t.integer  "read_teacher_id"
    t.integer  "write_teacher_id"
    t.integer  "speak_teacher_id"
    t.integer  "completion_teacher_id"
    t.integer  "syntax_teacher_id"
    t.integer  "listen_goal_score"
    t.integer  "read_goal_score"
    t.integer  "write_goal_score"
    t.integer  "speak_goal_score"
    t.integer  "completion_goal_score"
    t.integer  "syntax_goal_score"
    t.integer  "total_goal_score"
    t.integer  "last_exam_score"
    t.string   "notes"
    t.string   "parent_name"
    t.string   "parent_email"
    t.string   "parent_tel"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "lessons", :force => true do |t|
    t.string   "name",                               :null => false
    t.string   "code",                 :limit => 32, :null => false
    t.integer  "consuming_time"
    t.integer  "teaching_material_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "wordcounts"
  end

  create_table "meanings", :force => true do |t|
    t.integer  "word_id"
    t.string   "content"
    t.integer  "is_confirmed"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "paper_words", :force => true do |t|
    t.integer  "paper_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "word_id"
  end

  create_table "papers", :force => true do |t|
    t.integer  "exam_type_id"
    t.integer  "is_before"
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "start_word"
    t.integer  "end_word"
  end

  create_table "result_papers", :force => true do |t|
    t.integer  "paper_id"
    t.integer  "user_id"
    t.integer  "score"
    t.float    "rate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "exam_id"
    t.integer  "status"
  end

  create_table "result_words", :force => true do |t|
    t.integer  "word_id"
    t.integer  "result_paper_id"
    t.integer  "is_right"
    t.string   "answer"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "remark"
    t.integer  "exception_type"
    t.integer  "has_exception"
    t.boolean  "exception_handle",    :default => false
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

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "teaching_materials", :force => true do |t|
    t.string   "name",                     :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "code",       :limit => 32
  end

  create_table "teaching_problems", :force => true do |t|
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.boolean  "sloved",       :default => false
    t.string   "slove_spec"
    t.string   "problem_spec"
    t.integer  "problem_type", :default => 0
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
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
    t.boolean  "is_activity",                         :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "word_meanings", :force => true do |t|
    t.integer  "word_id"
    t.integer  "meaning_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "word_properties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "words", :force => true do |t|
    t.integer  "book_name_id"
    t.integer  "word_property_id"
    t.string   "content"
    t.string   "phonogram"
    t.string   "prefix"
    t.string   "infix"
    t.string   "affix"
    t.string   "root"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
