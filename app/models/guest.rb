# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  ticket_id  :integer
#  event_id   :integer
#  foodie_id  :integer
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Guest < ActiveRecord::Base
  attr_accessible :email, :event_id, :first_name, :user_id, :last_name, :ticket_id, :token

  belongs_to :ticket, :dependent => :destroy
end
