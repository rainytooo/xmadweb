class AddTeacherToCourseContent < ActiveRecord::Migration
  def change
    add_column :course_contents, :teacher_id, :integer
    add_column :course_contents, :notes, :string ,:limit => 255
    add_column :dairy_plans, :notes, :string ,:limit => 255
  end
end
