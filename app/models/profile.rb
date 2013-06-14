class Profile < ActiveRecord::Base

  belongs_to :user
  attr_accessible :blurb, :home_zip, :location_id, :story, :work_zip, :user_id
end
