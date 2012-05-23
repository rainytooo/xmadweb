# encoding: utf-8
class CreateExtAttributes < ActiveRecord::Migration
  def change
    create_table :ext_attributes do |t|
      # 学生
      t.integer :student_id
      # 课时总数
      t.integer :total_class_count
      # 听力
      t.integer :listen_course_count
      # 阅读
      t.integer :read_course_count
      # 写作
      t.integer :write_course_count
      # 口语
      t.integer :speak_course_count
      # 填空
      t.integer :completion_course_count
      # 语法
      t.integer :syntax_course_count
      
      # 听力
      t.integer :listen_teacher_id
      # 阅读
      t.integer :read_teacher_id
      # 写作
      t.integer :write_teacher_id
      # 口语
      t.integer :speak_teacher_id
      # 填空
      t.integer :completion_teacher_id
      # 语法
      t.integer :syntax_teacher_id
      
      # 听力
      t.integer :listen_goal_score
      # 阅读
      t.integer :read_goal_score
      # 写作
      t.integer :write_goal_score
      # 口语
      t.integer :speak_goal_score
      # 填空
      t.integer :completion_goal_score
      # 语法
      t.integer :syntax_goal_score
      # 目标总分数
      t.integer :total_goal_score     
      # 上次托福成绩
      t.integer :last_exam_score
      
      # 备注信息
      t.string :notes, :limit => 255
      # 家长姓名
      t.string :parent_name
      # 家长邮箱
      t.string :parent_email
      # 家长电话
      t.string :parent_tel    
      
      t.timestamps
    end
  end
end
