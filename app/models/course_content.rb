# encoding: utf-8
# 学生的学习计划
class CourseContent < ActiveRecord::Base
  belongs_to :spm, :class_name => "User",
      :foreign_key => "spm_id"
  belongs_to :student, :class_name => "User",
      :foreign_key => "student_id"
  belongs_to :dairy_plan, :class_name => "DairyPlan",
      :foreign_key => "dairy_plan_id"
  belongs_to :teaching_material, :class_name => "TeachingMaterial",
      :foreign_key => "teaching_material_id"
  belongs_to :teaching_lesson, :class_name => "Lesson",
      :foreign_key => "lesson_id"
  belongs_to :word_material, :class_name => "TeachingMaterial",
      :foreign_key => "word_material_id"
  belongs_to :word_lesson, :class_name => "Lesson",
      :foreign_key => "word_counts"
  belongs_to :teacher, :class_name => "User",
      :foreign_key => "teacher_id"
  
  # 课程的节 字符串
  def course_num_str
    return "第#{course_num}节课"
  end
  
  def action_name
    case action_type
    when 0
      "未知"
    when 1
      "上课"
    when 2
      "背单词"
    when 3 
      "写作业"
    when 4
      "做课后测试"
    when 5
      "模拟考试"
    end
  end
end
