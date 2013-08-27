class AddFieldsToCharges < ActiveRecord::Migration
  def up
    add_column :charges, :amount, :integer
    add_column :charges, :stripe_charge_id, :string
    add_column :charges, :amount_refunded, :integer
    add_column :charges, :currency, :string, :default=>"usd"
    add_column :charges, :card_type, :string
    add_column :charges, :status, :string
    rename_column :charges, :token, :stripe_token
  end

  def down
  	remove_column :charges, :amount
  	remove_column :charges, :stripe_charge_id
  	remove_column :charges, :amount_refunded
  	remove_column :charges, :currency
  	remove_column :charges, :card_type
  	remove_column :charges, :status
  	rename_column :charges, :stripe_token, :token
  end
end
