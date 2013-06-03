class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :full_name
      t.string :last4
      t.integer :user_id
      t.string :token
      t.integer :location_id

      t.timestamps
    end
  end
end
