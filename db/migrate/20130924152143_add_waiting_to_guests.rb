class AddWaitingToGuests < ActiveRecord::Migration
  def up
    add_column :guests, :waiting, :boolean, :default => false
  end
  def down
  	remove_column :guests, :waiting
  end
end
