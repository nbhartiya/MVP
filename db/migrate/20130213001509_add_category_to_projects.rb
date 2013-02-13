class AddCategoryToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :category, :string
    add_column :projects, :approved, :boolean
  end
end
