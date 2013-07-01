class AddTimeToEvents < ActiveRecord::Migration
  def up
    add_column :events, :when, :time
    change_column :events, :date, :date
  end
  def down
  	remove_column :events, :when
  	change_column :events, :date, :datetime
  end	
end
