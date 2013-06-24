# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  full_name   :string(255)
#  last4       :string(255)
#  user_id     :integer
#  token       :string(255)
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Charge < ActiveRecord::Base
  attr_accessible :full_name, :last4, :location_id, :token, :user_id

  belongs_to :user
  has_many :guests
  belongs_to :billing_address, :class_name => "Location", :foreign_key => "billing_address_id"
end
