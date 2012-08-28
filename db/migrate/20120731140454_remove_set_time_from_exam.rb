class RemoveSetTimeFromExam < ActiveRecord::Migration
  def up
    remove_column :exams, :set_time
      end

  def down
    add_column :exams, :set_time, :datetime
  end
end
