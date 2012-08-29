class CreateExamTypes < ActiveRecord::Migration
  def change
    create_table :exam_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
