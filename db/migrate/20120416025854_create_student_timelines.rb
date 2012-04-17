# encoding: utf-8
class CreateStudentTimelines < ActiveRecord::Migration
  def change
    create_table :student_timelines do |t|
      t.datetime :arrival_time
      t.datetime :leave_time
      t.integer :action_type_1
      t.string :action_spec_1
      t.integer :location_type_1
      t.integer :action_type_2
      t.string :action_spec_2
      t.integer :location_type_2
      t.integer :action_type_3
      t.string :action_spec_3
      t.integer :location_type_3
      t.integer :action_type_4
      t.string :action_spec_4
      t.integer :location_type_4
      t.integer :action_type_5
      t.string :action_spec_5
      t.integer :location_type_5     
      
      t.string :remarks

      t.integer :jpm_id
      t.integer :student_id
      t.timestamps
    end
  end
  
  def up
    execute <<-SQL
        ALTER TABLE student_timelines
          ADD CONSTRAINT fk_student_timeline_jpm
          FOREIGN KEY (jpm_id)
          REFERENCES users(id)
    SQL
    execute <<-SQL
        ALTER TABLE student_timelines
          ADD CONSTRAINT fk_student_timeline_student
          FOREIGN KEY (student_id)
          REFERENCES users(id)
    SQL
  end
  def down
    execute "ALTER TABLE student_timelines DROP FOREIGN KEY fk_student_timeline_student"
    execute "ALTER TABLE student_timelines DROP FOREIGN KEY fk_student_timeline_jpm"
  end
end
