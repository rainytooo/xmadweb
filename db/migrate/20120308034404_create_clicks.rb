class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.string :tagname, :length => 128
      t.integer :clicks, :length => 10
      t.date  :record_date
    end
  end
end
