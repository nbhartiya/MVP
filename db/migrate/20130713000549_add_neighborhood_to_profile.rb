class AddNeighborhoodToProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :neighborhood, :string
  end
  def down
  	remove_column :profiles, :neighborhood
  end
end
