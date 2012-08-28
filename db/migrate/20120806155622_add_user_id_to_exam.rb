class AddUserIdToExam < ActiveRecord::Migration
  def change
    add_column :exams, :user_id, :integer

  end
end
