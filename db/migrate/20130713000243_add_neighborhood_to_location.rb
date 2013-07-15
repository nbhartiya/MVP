class AddNeighborhoodToLocation < ActiveRecord::Migration
  def up
    add_column :locations, :neighborhood, :string
  end
  def down
  	remove_column :locations, :neighborhood
  end
end
