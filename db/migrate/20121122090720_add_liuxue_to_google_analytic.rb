class AddLiuxueToGoogleAnalytic < ActiveRecord::Migration
  def change
    add_column :google_analytics, :liuxue, :string

  end
end
