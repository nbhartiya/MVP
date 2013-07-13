class AddYelpIdToProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :yelp_id, :string
  end
  def down
  	remove_column :profiles, :yelp_id
  end
end
