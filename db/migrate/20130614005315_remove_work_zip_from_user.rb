class RemoveWorkZipFromUser < ActiveRecord::Migration
  def up
  	remove_column :users, :work_zip
  end

  def down
  	add_column :users, :work_zip, :string
  end
end
