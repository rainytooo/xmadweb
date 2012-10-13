class AddUpCategoryToClick < ActiveRecord::Migration
  def change
    add_column :clicks, :up_category, :integer

  end
end
