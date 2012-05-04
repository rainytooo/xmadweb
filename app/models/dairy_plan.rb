# encoding: utf-8
# 学生的学习计划
class DairyPlan < ActiveRecord::Base
  belongs_to :spm, :class_name => "User",
      :foreign_key => "spm_id"
  belongs_to :student, :class_name => "User",
      :foreign_key => "student_id"
end
