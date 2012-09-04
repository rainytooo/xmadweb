class CreateTagTypes < ActiveRecord::Migration
  def change
    create_table :tag_types do |t|
      t.string :name
      t.text :descrition
      t.integer :upid

      t.timestamps
    end
  end
end
