class RemoveTagTypeFromClick < ActiveRecord::Migration
  def up
    remove_column :clicks, :tag_type
      end

  def down
    add_column :clicks, :tag_type, :string
  end
end
