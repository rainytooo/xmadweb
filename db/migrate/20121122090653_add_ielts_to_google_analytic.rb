class AddIeltsToGoogleAnalytic < ActiveRecord::Migration
  def change
    add_column :google_analytics, :ielts, :string

  end
end
