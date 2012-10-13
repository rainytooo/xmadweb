class AddCategoryToClick < ActiveRecord::Migration
  def change
    add_column :clicks, :category, :integer

  end
end
