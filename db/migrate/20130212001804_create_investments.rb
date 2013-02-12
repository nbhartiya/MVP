class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :amount

      t.timestamps
    end
  end
end
