class AddJpmAndSpmToUser < ActiveRecord::Migration
  def change
    add_column :users, :jpm_id, :integer
    add_column :users, :spm_id, :integer
  end
  def up
    execute <<-SQL
        ALTER TABLE users
          ADD CONSTRAINT fk_student_jpm
          FOREIGN KEY (jpm_id)
          REFERENCES users(id)
    SQL
    execute <<-SQL
        ALTER TABLE users
          ADD CONSTRAINT fk_student_spm
          FOREIGN KEY (spm_id)
          REFERENCES users(id)
    SQL
  end
  def down
    execute "ALTER TABLE users DROP FOREIGN KEY fk_student_jpm"
    execute "ALTER TABLE users DROP FOREIGN KEY fk_student_spm"
  end
end
