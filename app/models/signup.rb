# == Schema Information
#
# Table name: signups
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  chef       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Signup < ActiveRecord::Base
  before_create :signup_email
  
  def signup_email
    if self.chef?
      NotificationMailer.waitlist_chef_email(self).deliver
    else
      NotificationMailer.waitlist_email(self).deliver
    end
  end
  
  attr_accessible :email, :chef
  
  # Makeshift email validation for now
  validates :email, :presence => true,
    :length => {:minimum => 3, :maximum => 254},
    :uniqueness => {:message => "You've signed up with us already!"},
    :format => /@/
end
