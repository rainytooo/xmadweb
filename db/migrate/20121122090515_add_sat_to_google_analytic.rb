class AddSatToGoogleAnalytic < ActiveRecord::Migration
  def change
    add_column :google_analytics, :sat, :string

  end
end
