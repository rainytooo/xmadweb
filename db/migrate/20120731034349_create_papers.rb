class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.integer :exam_type_id
      t.integer :is_before
      t.string :name

      t.timestamps
    end
  end
end
