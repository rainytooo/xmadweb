# encoding: utf-8
class Result < ActiveRecord::Base
  belongs_to :jpm, :class_name => "User",
      :foreign_key => "jpm_id"
  belongs_to :student, :class_name => "User",
      :foreign_key => "student_id"
end
