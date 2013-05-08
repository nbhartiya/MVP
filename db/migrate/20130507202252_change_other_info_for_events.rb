class ChangeOtherInfoForEvents < ActiveRecord::Migration
  def up
  	change_column :events, :other_info, :text
  end
  def down
  	change_column :events, :other_info, :string
  end
end
