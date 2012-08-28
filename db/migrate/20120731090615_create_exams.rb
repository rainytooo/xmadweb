class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :paper_id
      t.datetime :start_time
      t.datetime :finish_time
      t.integer :set_time

      t.timestamps
    end
  end
end
