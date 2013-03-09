class RemoveTokenFromAuthentications < ActiveRecord::Migration
  def up
    remove_column :authentications, :token
  end

  def down
    add_column :authentications, :token, :string
  end
end
