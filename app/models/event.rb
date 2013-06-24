# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  people_limit   :integer
#  description    :text
#  menu_pdf       :string(255)
#  menu_text      :text
#  date           :datetime
#  cost           :float
#  location_title :string(255)
#  length         :integer
#  other_info     :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  host_id        :integer
#  neighborhood   :string(255)
#  blurb          :text
#

class Event < ActiveRecord::Base
  
  has_one :location
  has_many :images, :as => :imageable, :dependent => :destroy
  belongs_to :host, :class_name => "User", :foreign_key => "host_id"
  has_many :tickets
  has_many :guests, :through => :tickets
  
  attr_accessible :other_info, :length, :location_title, :cost, :date, :description, :menu_pdf, :menu_text, :people_limit, :title, :host_id, :images_attributes

  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true
end
