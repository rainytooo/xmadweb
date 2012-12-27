class CreateOrganicTraffics < ActiveRecord::Migration
  def change
    create_table :organic_traffics do |t|
      t.date :current_date
      t.string :keyword
      t.integer :clicks
      t.integer :data1
      t.integer :data2
      t.string :rate1
      t.string :rate2

      # t.timestamps
    end
  end
end
