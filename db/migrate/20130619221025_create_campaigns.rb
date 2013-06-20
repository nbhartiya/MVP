class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :biz_name
      t.text :blurb
      t.text :about
      t.text :why_join
      t.integer :location_id
      t.integer :campaign_starter_id
      t.integer :host_id

      t.timestamps
    end
  end
end
