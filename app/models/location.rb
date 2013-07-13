# == Schema Information
#
# Table name: locations
#
#  id           :integer          not null, primary key
#  address1     :string(255)
#  address2     :string(255)
#  city         :string(255)
#  state        :string(255)
#  zipcode      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  event_id     :integer
#  neighborhood :string(255)
#

class Location < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  has_many :charges, :foreign_key => "billing_address_id"
  
  attr_accessible :address1, :address2, :city, :state, :zipcode, :user_id, :event_id, :neighborhood
end
