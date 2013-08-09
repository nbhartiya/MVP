class AddTokenToAuthentications < ActiveRecord::Migration
  def up
    add_column :authentications, :token, :string
  end
  def down
  	remove_column :authentications, :token
  end
end
