class CreateReferralTraffics < ActiveRecord::Migration
  def change
    create_table :referral_traffics do |t|
      t.string :source_name
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
