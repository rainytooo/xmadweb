class AddWordChildCategoryIdToVocabulary < ActiveRecord::Migration
  def change
    add_column :vocabularies, :word_child_category_id, :integer

  end
end
