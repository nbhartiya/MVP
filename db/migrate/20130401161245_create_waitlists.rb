class CreateWaitlists < ActiveRecord::Migration
  def change
    create_table :waitlists do |t|
      t.string :email
      t.string :kind

      t.timestamps
    end
  end
end
