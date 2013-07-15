class RemoveLocationTitleFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :location_title
  end

  def down
    add_column :events, :location_title, :string
  end
end
