class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :kind
      t.boolean :approved

      t.timestamps
    end
  end
end
