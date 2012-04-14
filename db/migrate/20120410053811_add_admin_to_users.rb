class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :limit => 255
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :role, :integer, :limit => 3, :default => 0
  end
end
