class CreateWaitlists < ActiveRecord::Migration
  def change
    create_table :waitlists do |t|
      t.integer :event_id
      t.integer :user_id
      t.boolean :off, :default => false

      t.timestamps
    end
  end
end
