class Signup < ActiveRecord::Base
  attr_accessible :email, :chef
  
  # Makeshift email validation for now
  validates :email, :presence => true,
    :length => {:minimum => 3, :maximum => 254},
    :uniqueness => true,
    :format => /@/
end
