class AddReferralCodesToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :discount, :float
    add_column :tickets, :giveaway_code_id, :integer
    add_column :tickets, :applied_code_id, :integer
  end
end
