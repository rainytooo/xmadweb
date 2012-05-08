# encoding: utf-8
# 学生的学习计划
class CourseContent < ActiveRecord::Base
  belongs_to :spm, :class_name => "User",
      :foreign_key => "spm_id"
  belongs_to :student, :class_name => "User",
      :foreign_key => "student_id"
  belongs_to :dairy_plan, :class_name => "DairyPlan",
      :foreign_key => "dairy_plan_id"
  
  # 课程的节 字符串
  def course_num_str
    return "第#{course_num}节课"
  end
end
