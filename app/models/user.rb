class User < ActiveRecord::Base
  attr_accessible :approved, :first_name, :last_name, :type
end
