class AddDefaultApprovedToUsers < ActiveRecord::Migration
  def change
    change_column :users, :approved, :boolean, :default => false
  end
end
