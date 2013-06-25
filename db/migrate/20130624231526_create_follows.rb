class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :followable_id
      t.string :followable_type

      t.timestamps
    end

    add_index :follows, [:followable_id, :followable_type]
  end
end
