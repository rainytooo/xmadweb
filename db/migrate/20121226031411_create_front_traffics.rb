class CreateFrontTraffics < ActiveRecord::Migration
  def change
    create_table :front_traffics do |t|
      t.date :current_date
      t.string :source_name
      t.integer :clicks
      t.integer :data1
      t.integer :data2
      t.string :rate1
      t.string :rate2

    end
  end
end
