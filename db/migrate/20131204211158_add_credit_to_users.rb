class AddCreditToUsers < ActiveRecord::Migration
  def up
    add_column :users, :credit, :float
  end
  def down
  	remove_column :users, :credit
  end
end
