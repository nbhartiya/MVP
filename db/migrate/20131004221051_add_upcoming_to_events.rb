class AddUpcomingToEvents < ActiveRecord::Migration
  def up
    add_column :events, :upcoming, :boolean, :default => false
  end
  def down
  	remove_column :events, :upcoming
  end
end
