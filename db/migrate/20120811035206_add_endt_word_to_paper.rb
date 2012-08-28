class AddEndtWordToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :end_word, :integer

  end
end
