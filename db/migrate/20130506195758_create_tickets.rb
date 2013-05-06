class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :foodie_id
      t.integer :event_id
      t.integer :purchaser_id
      t.integer :num_guests
      t.integer :guest_id

      t.timestamps
    end
  end
end
