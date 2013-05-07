class RemoveLocationIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :location_id
  end

  def down
    add_column :users, :location_id, :integer
  end
end
