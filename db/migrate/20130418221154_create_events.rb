class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :location_id
      t.integer :people_limit
      t.text :description
      t.string :menu_pdf
      t.text :menu_text
      t.datetime :date
      t.float :cost
      t.string :location_title
      t.integer :length
      t.string :other_info

      t.timestamps
    end
  end
end
