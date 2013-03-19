class CreateAccreditations < ActiveRecord::Migration
  def change
    create_table :accreditations do |t|
      t.string :individual_income
      t.string :joint_income
      t.string :net_worth
      t.boolean :experience
      t.boolean :agree

      t.timestamps
    end
  end
end
