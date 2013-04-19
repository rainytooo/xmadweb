class CreateVocabularyMeanings < ActiveRecord::Migration
  def change
    create_table :vocabulary_meanings do |t|
      t.integer :vocabulary_id
      t.text :content

      t.timestamps
    end
  end
end
