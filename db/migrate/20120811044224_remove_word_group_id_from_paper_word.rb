class RemoveWordGroupIdFromPaperWord < ActiveRecord::Migration
  def up
    remove_column :paper_words, :word_group_id
      end

  def down
    add_column :paper_words, :word_group_id, :integer
  end
end
