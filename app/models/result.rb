# encoding: utf-8
class Result < ActiveRecord::Base
  belongs_to :jpm, :class_name => "User",
      :foreign_key => "jpm_id"
  belongs_to :student, :class_name => "User",
      :foreign_key => "student_id"
  # 异常
  def exception
    case exception_type
    when 0
      "没有延迟"
    when 1
      "老师没提交"
    when 2
      "学生未完成"
    when 3 
      "学其他异常"
    when 4
      "测试改期"
    when 5
      "其他"
    end
  end
  
  def has_exception_str
    case has_exception
    when 0
      "没有"
    when 1
      "有"
    end
  end
end
