# encoding: utf-8
class ExtAttribute < ActiveRecord::Base
  belongs_to :listen_teacher, :class_name => "User",
        :foreign_key => "listen_teacher_id"
  belongs_to :read_teacher, :class_name => "User",
        :foreign_key => "read_teacher_id"
  belongs_to :write_teacher, :class_name => "User",
        :foreign_key => "write_teacher_id"
  belongs_to :speak_teacher, :class_name => "User",
        :foreign_key => "speak_teacher_id"
  belongs_to :completion_teacher, :class_name => "User",
        :foreign_key => "completion_teacher_id"
  belongs_to :syntax_teacher, :class_name => "User",
        :foreign_key => "syntax_teacher_id"
  belongs_to :student, :class_name => "User",
        :foreign_key => "student_id"
        
  # 添加标签的功能
  acts_as_taggable
  # 考试标签
  acts_as_taggable_on :exams
  
end
