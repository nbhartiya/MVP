class AddPointsToUsers < ActiveRecord::Migration
  def change
      add_column :users, :points, :text
  end
end
