class MakeSuccessfulDefaultToFalseForCampaigns < ActiveRecord::Migration
  def change
    change_column :campaigns, :successful, :boolean, :default => false
  end
end
