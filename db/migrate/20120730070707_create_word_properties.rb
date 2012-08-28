class CreateWordProperties < ActiveRecord::Migration
  def change
    create_table :word_properties do |t|
      t.string :name

      t.timestamps
    end
  end
end
