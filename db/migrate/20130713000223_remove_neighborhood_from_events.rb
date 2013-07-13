class RemoveNeighborhoodFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :neighborhood
  end

  def down
    add_column :events, :neighborhood, :string
  end
end
