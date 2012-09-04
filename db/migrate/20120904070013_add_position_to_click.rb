class AddPositionToClick < ActiveRecord::Migration
  def change
    add_column :clicks, :position, :integer

  end
end
