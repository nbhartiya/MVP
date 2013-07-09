class AddChargeIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :charge_id, :integer
  end
end
