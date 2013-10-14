class AddApprovedToCampaigns < ActiveRecord::Migration
  def up
    add_column :campaigns, :approved, :boolean, :default => false
    add_column :campaigns, :yelp_id, :string
  end
  def down
  	remove_column :campaigns, :approved
  	remove_column :campaigns, :yelp_id
  end
end
