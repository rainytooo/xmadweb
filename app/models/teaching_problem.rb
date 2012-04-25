# encoding: utf-8
# 教学问题
class TeachingProblem < ActiveRecord::Base
  belongs_to :teacher, :class_name => "User",
      :foreign_key => "teacher_id"
  belongs_to :student, :class_name => "User",
      :foreign_key => "student_id"
  # 添加标签的功能
  acts_as_taggable
  # 考试标签 科目标签
  acts_as_taggable_on :subjects, :depts
  
  def problem_type_str
    case problem_type
      when 0
        "其他"
      when 1
        "学生作业未完成"
      when 2
        "学生测试未完成"
      when 3
        "学生迟到或者早退"
      when 4
        "老师没有批改或提交"
      when 5
        "老师没有布置作业或侧试"
      when 6
        "单词不合格"
      when 7
        "测试不合格"
    end
  end
end
