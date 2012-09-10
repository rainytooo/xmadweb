class RemoveWordPropertyIdFromWord < ActiveRecord::Migration
  def up
    remove_column :words, :word_property_id
      end

  def down
    add_column :words, :word_property_id, :integer
  end
end
