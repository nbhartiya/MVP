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
  belongs_to :location
  attr_accessible :blurb, :home_zip, :location_id, :story, :work_zip, :user_id, :biz_name, :yelp_id, :neighborhood
end
