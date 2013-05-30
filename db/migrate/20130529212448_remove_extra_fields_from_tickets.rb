class RemoveExtraFieldsFromTickets < ActiveRecord::Migration
  def up
  	remove_column :tickets, :purchaser_id
  	remove_column :tickets, :guest_id
  	add_column :tickets, :total_paid, :float
  	rename_column :tickets, :foodie_id, :user_id
  	rename_column :guests, :foodie_id, :user_id
  end

  def down
  	add_column :tickets, :purchaser_id, :integer
  	add_column :tickets, :guest_id, :integer
  	remove_column :tickets, :total_paid
  	rename_column :tickets, :user_id, :foodie_id
  	rename_column :guests, :user_id, :foodie_id
  end
end
