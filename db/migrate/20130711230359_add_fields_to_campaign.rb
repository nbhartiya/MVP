class AddFieldsToCampaign < ActiveRecord::Migration
  def up
    add_column :campaigns, :successful, :boolean
    add_column :campaigns, :expires, :date
  end
  def down
  	remove_column :campaigns, :successful
  	remove_column :campaigns, :expires
  end
end
