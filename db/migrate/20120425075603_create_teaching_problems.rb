# encoding: utf-8
class CreateTeachingProblems < ActiveRecord::Migration
  def change
    create_table :teaching_problems do |t|
      # 学生
      t.integer :student_id
      # 老师
      t.integer :teacher_id
      # 是否解决 默认是没有
      t.boolean :sloved, :default => false
      # 解决方式
      t.string :slove_spec
      # 问题详细描述
      t.string :problem_spec, :limit => 255
      # 问题种类
      t.integer :problem_type, :default => 0
          
      t.timestamps
    end
  end
  
  def up
    execute <<-SQL
        ALTER TABLE teaching_problems
          ADD CONSTRAINT fk_teaching_problem_student
          FOREIGN KEY (student_id)
          REFERENCES users(id)
    SQL
    execute <<-SQL
        ALTER TABLE teaching_problems
          ADD CONSTRAINT fk_teaching_problem_teacher
          FOREIGN KEY (teacher_id)
          REFERENCES users(id)
    SQL
  end
  def down
    execute "ALTER TABLE teaching_problems DROP FOREIGN KEY fk_teaching_problem_student"
    execute "ALTER TABLE teaching_problems DROP FOREIGN KEY fk_teaching_problem_teacher"
  end
end
