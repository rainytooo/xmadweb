# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
          :admin, :role, :name, :jpm_id, :spm_id, :is_activity
  # 新添加的role 0是默认 1 学生 2 教师 3 督导助理 4 督导 5 客户经理 
  # 显示用户的方法
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
  
  # 从督导的角度来说 他有很多学生
  
  # 从学生的角度来说 他有一个督导
  belongs_to :jpm, :class_name => "User",
      :foreign_key => "jpm_id"
      
  # 从学生的角度来说 他有一个客户经理
  belongs_to :spm, :class_name => "User",
      :foreign_key => "spm_id"

  def rolename
    case role
    when 1
      "学生"
    when 2
      "教师"
    when 3
      "督导助理"
    when 4 
      "督导"
    when 5
      "客户经理"
    end
  end
end
