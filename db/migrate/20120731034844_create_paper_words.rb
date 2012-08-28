class CreatePaperWords < ActiveRecord::Migration
  def change
    create_table :paper_words do |t|
      t.integer :paper_id
      t.integer :word_group_id

      t.timestamps
    end
  end
end
