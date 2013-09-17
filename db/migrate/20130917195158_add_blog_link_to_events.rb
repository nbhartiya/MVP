class AddBlogLinkToEvents < ActiveRecord::Migration
  def up
    add_column :events, :blog_link, :string
  end
  def down
  	remove_column :events, :blog_link
  end
end
