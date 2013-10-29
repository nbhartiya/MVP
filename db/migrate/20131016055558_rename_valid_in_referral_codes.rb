class RenameValidInReferralCodes < ActiveRecord::Migration
  def up
  	rename_column :referral_codes, :valid, :is_valid
  end

  def down
  	rename_column :referral_codes, :is_valid, :valid
  end
end
