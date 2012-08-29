class AddSetTimeToExam < ActiveRecord::Migration
  def change
    add_column :exams, :set_time, :integer

  end
end
