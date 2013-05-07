class RemoveLocationIdFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :location_id
  end

  def down
    add_column :events, :location_id, :integer
  end
end
