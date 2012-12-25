class CreateCoreBbsCustomers < ActiveRecord::Migration
  def change
    create_table :core_bbs_customers do |t|
      t.integer :uid
      t.string :current_date
      t.integer :friend
      t.integer :doing
      t.integer :blog
      t.integer :post
      t.integer :thread
      t.integer :share
      t.integer :online
      t.integer :post_back

      t.timestamps
    end
  end
end
