class CreateGoogleTrafficRankings < ActiveRecord::Migration
  def change
    create_table :google_traffic_rankings do |t|
      t.string :current_date
      t.string :source_name
      t.string :visits
      t.string :channel_type

      # t.timestamps
    end
  end
end
