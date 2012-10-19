class AddTagTypeToClick < ActiveRecord::Migration
  def change
    add_column :clicks, :tag_type, :string

  end
end
