class AddPageToClick < ActiveRecord::Migration
  def change
    add_column :clicks, :page, :integer

  end
end
