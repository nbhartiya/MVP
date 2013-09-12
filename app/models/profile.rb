# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  blurb        :text
#  location_id  :integer
#  story        :text
#  home_zip     :string(255)
#  work_zip     :string(255)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  biz_name     :string(255)
#  yelp_id      :string(255)
#  neighborhood :string(255)
#

class Profile < ActiveRecord::Base

  belongs_to :user
  #should this maybe be has one location?
  belongs_to :location
  has_many :covers, :as => :imageable, :class_name =>"Image", :conditions => {:secondary_imageable_type => "cover"}, :dependent => :destroy
  has_one :avatar, :as => :imageable, :class_name =>"Image", :conditions => {:secondary_imageable_type => "avatar"}, :dependent => :destroy
  attr_accessible :blurb, :home_zip, :location_id, :story, :work_zip, :user_id, :biz_name, :yelp_id, :neighborhood, :news, :website

  has_many :follows, :as => :followable, :dependent => :destroy

  def host_events
  	Event.where("host_id in (?)", self.user_id)
    #is self.user.events_hosted better?
  end

  def past_host_events
  	self.host_events.where("date < ?", Date.today)
  end

  def future_host_events
  	self.host_events.where("date >= ?", Date.today)
  end

  def foodie_host_followers
  	#AskGabe: code here to determine the follows that have user type foodie
  end

  def business_host_followers
  end
end
