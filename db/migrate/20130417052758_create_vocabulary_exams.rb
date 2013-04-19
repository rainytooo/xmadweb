class CreateVocabularyExams < ActiveRecord::Migration
  def change
    create_table :vocabulary_exams do |t|
      t.integer :user_id
      t.integer :child_id

      t.timestamps
    end
  end
end
