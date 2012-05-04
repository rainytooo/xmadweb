# encoding: utf-8
class CreateDairyPlans < ActiveRecord::Migration
  def change
    create_table :dairy_plans do |t|
      # 学习计划的发生日期
      t.datetime :plan_date
      
      # 客户经理
      t.integer :spm_id
      # 所属学生
      t.integer :student_id
      t.timestamps
    end
  end
  
  def up
    execute <<-SQL
        ALTER TABLE dairy_plans
          ADD CONSTRAINT fk_dairy_plan_spm
          FOREIGN KEY (spm_id)
          REFERENCES users(id)
    SQL
    execute <<-SQL
        ALTER TABLE dairy_plans
          ADD CONSTRAINT fk_dairy_plan_student
          FOREIGN KEY (student_id)
          REFERENCES users(id)
    SQL
  end
  def down
    execute "ALTER TABLE dairy_plans DROP FOREIGN KEY fk_dairy_plan_student"
    execute "ALTER TABLE dairy_plans DROP FOREIGN KEY fk_dairy_plan_spm"
  end
end
