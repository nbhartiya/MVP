class AddCategoryToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :category, :string
    add_column :projects, :approved, :boolean
    add_column :projects, :phone_number, :number
  end
end
