# encoding: utf-8
# 学生的时间追踪
class StudentTimeline < ActiveRecord::Base
  belongs_to :jpm, :class_name => "User",
      :foreign_key => "jpm_id"
  belongs_to :student, :class_name => "User",
      :foreign_key => "student_id"
  #location_type  0 未知 1 教室 2自习室
  #action_type  0 未知 1 上课 2自习
  #action_spec  补充说明
  #remarks 其他补充
  
  # 简单获取地点的名称
  def location_name (location_type_n)
    case location_type_n
    when 0
      "未知"
    when 1
      "教室"
    when 2
      "自习室"
    end
  end
  # 简单获取行为名称
  def action_name (action_type_n)
    case action_type_n
    when 0
      "未知"
    when 1
      "上课"
    when 2
      "自习"
    end
  end
end
