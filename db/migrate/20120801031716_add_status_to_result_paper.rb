class AddStatusToResultPaper < ActiveRecord::Migration
  def change
    add_column :result_papers, :status, :integer

  end
end
