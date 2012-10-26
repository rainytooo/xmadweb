class CreateGoogleAnalytics < ActiveRecord::Migration
  def change
    create_table :google_analytics do |t|
      t.string :current_date
      t.integer :unique_visitor
      t.integer :visit_product
      t.integer :product_page
      t.string :average_page
      t.string :conversion1
      t.string :stay_time
      t.string :bounce_rate
      t.integer :click
      t.string :conversion2

    end
  end
end
