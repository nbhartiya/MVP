class AddLocationIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :location_id, :integer
    remove_column :users, :zipcode
  end
  def down
  	remove_column :users, :location_id
  	add_column :users, :zipcode, :string
  end
end
