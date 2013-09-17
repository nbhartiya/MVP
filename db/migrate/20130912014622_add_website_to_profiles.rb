class AddWebsiteToProfiles < ActiveRecord::Migration
  def up
    add_column :profiles, :website, :string
  end
  def down
  	remove_column :profiles, :website
  end
end
