class RemoveTokenSecretFromAuthentications < ActiveRecord::Migration
  def up
    remove_column :authentications, :token_secret
  end

  def down
    add_column :authentications, :token_secret, :string
  end
end
