class AddWorkZipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :work_zip, :string
  end
end
