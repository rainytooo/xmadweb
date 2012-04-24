class Lesson < ActiveRecord::Base
  belongs_to :teaching_material, :class_name => "TeachingMaterial",
      :foreign_key => "teaching_material_id"
end
