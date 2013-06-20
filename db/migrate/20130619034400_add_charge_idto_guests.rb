class AddChargeIdtoGuests < ActiveRecord::Migration
  def up
  	add_column :guests, :charge_id, :integer
  end

  def down
  	remove_column :guests, :charge_id
  end
end
