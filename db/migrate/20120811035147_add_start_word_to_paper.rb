class AddStartWordToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :start_word, :integer

  end
end
