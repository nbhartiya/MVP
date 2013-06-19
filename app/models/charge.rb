class Charge < ActiveRecord::Base
  attr_accessible :full_name, :last4, :location_id, :token, :user_id

  belongs_to :user
  has_many :guests
  belongs_to :billing_address, :class_name => "Location", :foreign_key => "billing_address_id"
end
