class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :words_score1, :length => 10 
      t.integer :words_score2, :length => 10 
      t.integer :words_score3, :length => 10 
      t.integer :words_score4, :length => 10 
      t.integer :listen_score1, :length => 10 
      t.integer :listen_words_score1, :length => 10 
      t.integer :write_score1, :length => 10 
      t.integer :write_words_score1, :length => 10 
      t.integer :read_score1, :length => 10
      t.integer :read_words_score1, :length => 10 
      t.integer :spoken_score1, :length => 10
      t.integer :spoken_words_score1, :length => 10 
      
      t.datetime :result_date
      
      t.integer :jpm_id
      t.integer :student_id
      #t.references :user
      
      t.timestamps
    end
  end
  
  def up
    execute <<-SQL
        ALTER TABLE users
          ADD CONSTRAINT fk_results_jpm
          FOREIGN KEY (jpm_id)
          REFERENCES users(id)
    SQL
    execute <<-SQL
        ALTER TABLE users
          ADD CONSTRAINT fk_results_student
          FOREIGN KEY (student_id)
          REFERENCES users(id)
    SQL
  end
  def down
    execute "ALTER TABLE users DROP FOREIGN KEY fk_results_student"
    execute "ALTER TABLE users DROP FOREIGN KEY fk_results_jpm"
  end
end
