class AddBizNameToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :biz_name, :string
  end
end
