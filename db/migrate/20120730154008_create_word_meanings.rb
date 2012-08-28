class CreateWordMeanings < ActiveRecord::Migration
  def change
    create_table :word_meanings do |t|
      t.integer :word_id
      t.integer :meaning_id

      t.timestamps
    end
  end
end
