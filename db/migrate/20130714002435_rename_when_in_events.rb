class RenameWhenInEvents < ActiveRecord::Migration
  def up
  	rename_column :events, :when, :time
  end

  def down
  	rename_column :events, :time, :when
  end
end
