class ChangeFieldTypeForUser < ActiveRecord::Migration
  def up
  	change_column :users, :chef, :boolean
  end

  def down
  	change_column :users, :chef, :string
  end
end
