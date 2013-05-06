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
  attr_accessible :event_id, :foodie_id, :guest_id, :num_guests, :purchaser_id
  belongs_to :event
  belongs_to :foodie, :class_name => "User"
  has_many :guests
end
