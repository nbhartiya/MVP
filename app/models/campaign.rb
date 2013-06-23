class Campaign < ActiveRecord::Base
  attr_accessible :about, :blurb, :biz_name, :campaign_starter_id, :host_id, :location_id, :why_join

  belongs_to :campaign_starter, :class_name => "User", :foreign_key => "campaign_starter_id"
  belongs_to :host, :class_name => "User", :foreign_key => "host_id"
  
end
