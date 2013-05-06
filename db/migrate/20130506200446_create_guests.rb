class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :ticket_id
      t.integer :event_id
      t.integer :foodie_id
      t.string :token

      t.timestamps
    end
  end
end
