class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :blurb
      t.integer :location_id
      t.text :story
      t.string :home_zip
      t.string :work_zip
      t.integer :user_id

      t.timestamps
    end
  end
end
