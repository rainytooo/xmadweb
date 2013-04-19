class CreateVocabularyAnswers < ActiveRecord::Migration
  def change
    create_table :vocabulary_answers do |t|
      t.integer :vocabulary_id
      t.string :content
      t.boolean :is_correct, :default => false

      t.timestamps
    end
  end
end
