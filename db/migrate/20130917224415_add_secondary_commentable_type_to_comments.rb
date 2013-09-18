class AddSecondaryCommentableTypeToComments < ActiveRecord::Migration
  def up
    add_column :comments, :secondary_commentable_type, :string
  end
  def down
  	remove_column :comments, :secondary_commentable_type
  end
end
