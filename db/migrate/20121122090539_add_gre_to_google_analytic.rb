class AddGreToGoogleAnalytic < ActiveRecord::Migration
  def change
    add_column :google_analytics, :gre, :string

  end
end
