class AddExceptionHandleToResults < ActiveRecord::Migration
  def change
    add_column :results, :exception_handle, :boolean, :default => false
  end
end
