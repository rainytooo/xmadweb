class CreateOrganicTraffics < ActiveRecord::Migration
  def change
    create_table :organic_traffics do |t|
      t.string :keyword
      t.integer :clicks
      t.integer :goal1
      t.float :conversion1_rate
      t.integer :goal3
      t.float :conversion3_rate
      t.date :current_date

      # t.timestamps
    end
  end
end
