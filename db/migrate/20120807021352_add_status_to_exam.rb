class AddStatusToExam < ActiveRecord::Migration
  def change
    add_column :exams, :status, :integer

  end
end
