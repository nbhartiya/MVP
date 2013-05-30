# == Schema Information
#
# Table name: tickets
#
#  id           :integer          not null, primary key
#  foodie_id    :integer
#  event_id     :integer
#  purchaser_id :integer
#  num_guests   :integer
#  guest_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Ticket < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :num_guests, :guests_attributes, :total_paid
  belongs_to :event
  belongs_to :user

  has_many :guests, :dependent => :destroy
  accepts_nested_attributes_for :guests, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
end
