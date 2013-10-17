class CreateReferralCodes < ActiveRecord::Migration
  def change
    create_table :referral_codes do |t|
      t.string :code
      t.integer :user_id
      t.integer :event_id
      t.boolean :valid
      t.float :referee_discount
      t.float :referer_discount
      t.integer :redeemed_num

      t.timestamps
    end
  end
end
