class RenameKindForUser < ActiveRecord::Migration
  def up
  	rename_column :users, :kind, :chef
  end

  def down
  	rename_column :users, :chef, :kind
  end
end
