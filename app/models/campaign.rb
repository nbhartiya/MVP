# == Schema Information
#
# Table name: campaigns
#
#  id                  :integer          not null, primary key
#  biz_name            :string(255)
#  blurb               :text
#  about               :text
#  why_join            :text
#  location_id         :integer
#  campaign_starter_id :integer
#  host_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Campaign < ActiveRecord::Base
  attr_accessible :about, :blurb, :biz_name, :campaign_starter_id, :host_id, :location_id, :why_join

  belongs_to :campaign_starter, :class_name => "User", :foreign_key => "campaign_starter_id"
  belongs_to :host, :class_name => "User", :foreign_key => "host_id"
  
end
