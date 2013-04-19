class CreateWordChildCategories < ActiveRecord::Migration
  def change
    create_table :word_child_categories do |t|
      t.integer :word_category_id
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
