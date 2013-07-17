class RemoveKindFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :kind
    add_column :users, :chef, :boolean
  end

  def down
    add_column :users, :kind, :string
    remove_column :users, :chef
  end
end
