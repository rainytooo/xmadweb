class CreateCoreBbsCustomers < ActiveRecord::Migration
  def change
    create_table :core_bbs_customers do |t|
      t.date :current_date
      t.string :source_name
      t.integer :clicks

      # t.timestamps
    end
  end
end
