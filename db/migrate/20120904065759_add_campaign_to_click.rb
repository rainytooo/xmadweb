class AddCampaignToClick < ActiveRecord::Migration
  def change
    add_column :clicks, :campaign, :integer

  end
end
