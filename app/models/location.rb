class Location < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :state, :zipcode
end