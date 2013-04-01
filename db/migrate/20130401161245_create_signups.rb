class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :email
      t.boolean :chef

      t.timestamps
    end
  end
end
