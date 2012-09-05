class CreateTagCategories < ActiveRecord::Migration
  def change
    create_table :tag_categories do |t|
      t.string :name
      t.integer :uid
      t.text :description

      t.timestamps
    end
  end
end
