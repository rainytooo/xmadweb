class AddWordPropertyIdToMeaning < ActiveRecord::Migration
  def change
    add_column :meanings, :word_property_id, :integer

  end
end
