class CreateMeanings < ActiveRecord::Migration
  def change
    create_table :meanings do |t|
      t.integer :word_id
      t.string :content
      t.integer :is_confirmed

      t.timestamps
    end
  end
end
