class AddDiscountsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :referee_discount, :float
    add_column :events, :referer_discount, :float
  end
end
