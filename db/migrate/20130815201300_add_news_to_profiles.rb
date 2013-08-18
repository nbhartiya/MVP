class AddNewsToProfiles < ActiveRecord::Migration
  def up
    add_column :profiles, :news, :text
  end
  def down
  	remove_column :profiles, :news
  end
end
