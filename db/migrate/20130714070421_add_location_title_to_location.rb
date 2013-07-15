class AddLocationTitleToLocation < ActiveRecord::Migration
  def up
    add_column :locations, :location_title, :string
  end
  def down
    remove_column :locations, :location_title
  end
end
