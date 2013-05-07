class ChangeOtherInfoForEvents < ActiveRecord::Migration
  def change
  	change_column :events, :other_info, :text
  end
end
