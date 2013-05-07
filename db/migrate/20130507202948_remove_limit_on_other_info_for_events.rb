class RemoveLimitOnOtherInfoForEvents < ActiveRecord::Migration
  def change
  	change_column :events, :other_info, :text, :limit => nil
  end
end
