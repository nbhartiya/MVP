class AddRefundDueToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :refund_due, :float
  end
end
