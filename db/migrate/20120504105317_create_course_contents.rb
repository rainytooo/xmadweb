class CreateCourseContents < ActiveRecord::Migration
  def change
    create_table :course_contents do |t|
      # 学习计划的发生日期
      t.datetime :plan_date     
      # 课程时间 1 2 3 4 5 一共5节课
      t.integer :course_num
      # 类型  1 上课(上课就只需要选择教材)  2 背单词 3 写作业 4 做测试(包括单词测和课后测)   
      t.integer :action_type

      # 如果上课 选择lesson
      t.integer :lesson_id
      # 教材编号
      t.integer :teaching_material_id
      # 客户经理
      t.integer :spm_id
      # 学生
      t.integer :student_id
      # 计划
      t.integer :dairy_plan_id
      # 单词教材编号
      t.integer :word_material_id
      # 单词数量
      t.integer :word_counts

      t.timestamps
    end
  end
end
