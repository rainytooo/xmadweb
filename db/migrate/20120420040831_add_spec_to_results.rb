class AddSpecToResults < ActiveRecord::Migration
  def change
    add_column :results, :remark, :string, :limit => 255
    add_column :results, :exception_type, :integer
    add_column :results, :has_exception, :integer
  end
end
