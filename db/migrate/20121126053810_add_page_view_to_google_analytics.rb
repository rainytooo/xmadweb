class AddPageViewToGoogleAnalytics < ActiveRecord::Migration
  def change
    add_column :google_analytics, :page_view, :integer

  end
end
