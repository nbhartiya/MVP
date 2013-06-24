# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  num_guests :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  total_paid :float
#

class Ticket < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :num_guests, :guests_attributes, :total_paid
  belongs_to :event
  belongs_to :user

  has_many :guests, :dependent => :destroy
  accepts_nested_attributes_for :guests, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
end
