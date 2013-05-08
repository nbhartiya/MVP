class RemoveLimitOnOtherInfoForEvents < ActiveRecord::Migration
  def up
  	change_column :events, :other_info, :text, :limit => nil
  end

  def down
  	change_column :events, :other_info, :text, :limit => 255
  end
end
