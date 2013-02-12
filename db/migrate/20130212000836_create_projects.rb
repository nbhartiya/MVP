class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.string :logo
      t.text :location
      t.text :description
      t.integer :target
      t.integer :raised
      t.text :terms
      t.integer :min_investment

      t.timestamps
    end
  end
end
