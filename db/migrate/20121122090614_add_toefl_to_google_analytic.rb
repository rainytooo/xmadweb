class AddToeflToGoogleAnalytic < ActiveRecord::Migration
  def change
    add_column :google_analytics, :toefl, :string

  end
end
