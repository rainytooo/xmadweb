class AddWordCountsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :wordcounts, :integer
  end
end
