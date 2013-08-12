class AddVeganToEvents < ActiveRecord::Migration
  def up
    add_column :events, :vegan, :boolean
    add_column :events, :vegetarian, :boolean
    add_column :events, :gluten_free, :boolean
  end
  def down
  	remove_column :events, :vegan
  	remove_column :events, :vegetarian
  	remove_column :events, :gluten_free
  end
end
