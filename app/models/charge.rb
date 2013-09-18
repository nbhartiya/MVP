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
  attr_accessible :full_name, :last4, :location_id, :stripe_token, :user_id, :amount, :stripe_charge_id, :amount_refunded, :currency, :card_type, :status

  belongs_to :user
  has_many :guests, :dependent => :destroy
  has_many :tickets, :dependent => :destroy
  belongs_to :location

  #after_save :purchase_confirmation_email

  #def purchase_confirmation_email
  #	binding.pry
  #	if status='paid'
  #	  NotificationMailer.event_purchase_email(self.tickets.first.event).deliver
  #	end
  #end
end
