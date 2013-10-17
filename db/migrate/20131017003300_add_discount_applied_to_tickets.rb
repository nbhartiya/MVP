class AddDiscountAppliedToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :discount_applied, :boolean
  end
end
