class AddApprovedToEvents < ActiveRecord::Migration
  def up
    add_column :events, :approved, :boolean, :default => false
  end
  def down
  	remove_column :events, :approved
  end
end
