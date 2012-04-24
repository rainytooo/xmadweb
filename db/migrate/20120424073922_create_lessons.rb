class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name, :limit => 255, :null => false
      t.string :code, :limit => 32, :null => false
      t.integer :consuming_time, :limit => 10
      
      t.integer :teaching_material_id
      
      t.timestamps
    end
  end
  
  def up
    execute <<-SQL
        ALTER TABLE lessons
          ADD CONSTRAINT fk_lessons_teaching_material
          FOREIGN KEY (teaching_material_id)
          REFERENCES teaching_materials(id)
    SQL
  end
  def down
    execute "ALTER TABLE lessons DROP FOREIGN KEY fk_lessons_teaching_material"
  end
end
