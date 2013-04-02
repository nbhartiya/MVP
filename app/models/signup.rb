class Signup < ActiveRecord::Base
  before_create :signup_email
  
  def signup_email
    NotificationMailer.waitlist_email(self).deliver
  end
  
  attr_accessible :email, :chef
  
  # Makeshift email validation for now
  validates :email, :presence => true,
    :length => {:minimum => 3, :maximum => 254},
    :uniqueness => true,
    :format => /@/
end
