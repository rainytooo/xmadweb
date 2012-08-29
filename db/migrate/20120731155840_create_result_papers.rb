class CreateResultPapers < ActiveRecord::Migration
  def change
    create_table :result_papers do |t|
      t.integer :paper_id
      t.integer :user_id
      t.integer :score
      t.float :rate

      t.timestamps
    end
  end
end
