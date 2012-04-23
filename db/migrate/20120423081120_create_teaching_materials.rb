class CreateTeachingMaterials < ActiveRecord::Migration
  def change
    create_table :teaching_materials do |t|
      t.string :name, :limit => 255, :null => false
      t.timestamps
    end
  end
end
