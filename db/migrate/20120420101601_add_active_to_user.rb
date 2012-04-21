class AddActiveToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_activity, :boolean, :default => true
  end
end
