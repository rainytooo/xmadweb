class CreateResultWords < ActiveRecord::Migration
  def change
    create_table :result_words do |t|
      t.integer :word_id
      t.integer :result_paper_id
      t.integer :is_right
      t.string :answer

      t.timestamps
    end
  end
end
