class AddCodeToTeachingMaterials < ActiveRecord::Migration
  def change
    add_column :teaching_materials, :code, :string, :limit => 32
  end
end
