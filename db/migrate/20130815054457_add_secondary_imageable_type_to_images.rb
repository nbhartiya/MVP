class AddSecondaryImageableTypeToImages < ActiveRecord::Migration
  def up
    add_column :images, :secondary_imageable_type, :string
  end
  def down
  	remove_column :images, :secondary_imageable_type
  end
end
