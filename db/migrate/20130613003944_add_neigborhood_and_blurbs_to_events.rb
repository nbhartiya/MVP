class AddNeigborhoodAndBlurbsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :neighborhood, :string
    add_column :events, :blurb, :text
  end
end
