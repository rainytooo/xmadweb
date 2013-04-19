class CreateWordCategories < ActiveRecord::Migration
  def change
    create_table :word_categories do |t|
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
