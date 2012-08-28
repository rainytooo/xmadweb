class AddWordIdToPaperWord < ActiveRecord::Migration
  def change
    add_column :paper_words, :word_id, :integer

  end
end
