class AddExamIdToResultPaper < ActiveRecord::Migration
  def change
    add_column :result_papers, :exam_id, :integer

  end
end
