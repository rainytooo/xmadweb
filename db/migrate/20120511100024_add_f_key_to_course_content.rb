class AddFKeyToCourseContent < ActiveRecord::Migration
  def change
  end
  def up
    execute <<-SQL
        ALTER TABLE course_contents
          ADD CONSTRAINT fk_course_contents_student
          FOREIGN KEY (student_id)
          REFERENCES users(id)
    SQL
    execute <<-SQL
        ALTER TABLE course_contents
          ADD CONSTRAINT fk_course_contents_spm
          FOREIGN KEY (spm_id)
          REFERENCES users(id)
    SQL
    execute <<-SQL
        ALTER TABLE course_contents
          ADD CONSTRAINT fk_course_contents_dairy_plan
          FOREIGN KEY (dairy_plan_id)
          REFERENCES dairy_plans(id)
    SQL
    execute <<-SQL
        ALTER TABLE course_contents
          ADD CONSTRAINT fk_course_contents_word_material
          FOREIGN KEY (word_material_id)
          REFERENCES teaching_materials(id)
    SQL
    execute <<-SQL
        ALTER TABLE course_contents
          ADD CONSTRAINT fk_course_contents_teaching_material
          FOREIGN KEY (teaching_material_id)
          REFERENCES teaching_materials(id)
    SQL
    execute <<-SQL
        ALTER TABLE course_contents
          ADD CONSTRAINT fk_course_contents_teaching_lesson
          FOREIGN KEY (lesson_id)
          REFERENCES lessons(id)
    SQL
    execute <<-SQL
        ALTER TABLE course_contents
          ADD CONSTRAINT fk_course_contents_word_lesson
          FOREIGN KEY (word_counts)
          REFERENCES lessons(id)
    SQL
  end
  def down
    execute "ALTER TABLE course_contents DROP FOREIGN KEY fk_course_contents_student"
    execute "ALTER TABLE course_contents DROP FOREIGN KEY fk_course_contents_spm"
    execute "ALTER TABLE course_contents DROP FOREIGN KEY fk_course_contents_dairy_plan"
    execute "ALTER TABLE course_contents DROP FOREIGN KEY fk_course_contents_word_material"
    execute "ALTER TABLE course_contents DROP FOREIGN KEY fk_course_contents_teaching_material"
    execute "ALTER TABLE course_contents DROP FOREIGN KEY fk_course_contents_teaching_lesson"
    execute "ALTER TABLE course_contents DROP FOREIGN KEY fk_course_contents_word_lesson"
  end
end
