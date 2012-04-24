# encoding: utf-8
# 教材
class TeachingMaterial < ActiveRecord::Base
  # 添加标签的功能
  acts_as_taggable
  # 考试标签 科目标签
  acts_as_taggable_on :exams, :subjects
  # 有课程
  has_many :lessons
end
