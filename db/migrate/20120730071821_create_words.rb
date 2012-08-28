class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :book_name_id
      t.integer :word_property_id
      t.string :content
      t.string :phonogram
      t.string :prefix
      t.string :infix
      t.string :affix
      t.string :root

      t.timestamps
    end
  end
end
