# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  people_limit :integer
#  description  :text
#  menu_pdf     :string(255)
#  menu_text    :text
#  date         :date
#  cost         :float
#  length       :integer
#  other_info   :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  host_id      :integer
#  blurb        :text
#  time         :time
#  vegan        :boolean
#  vegetarian   :boolean
#  gluten_free  :boolean
#

class Event < ActiveRecord::Base

  validates_presence_of :location, :unless => :upcoming
  
  has_one :location, :dependent => :destroy
  has_many :images, :as => :imageable, :dependent => :destroy
  has_many :covers, :as => :imageable, :class_name =>"Image", :conditions => {:secondary_imageable_type => "cover"}, :dependent => :destroy
  has_many :post_event_images, :as => :imageable, :class_name =>"Image", :conditions => {:secondary_imageable_type => "post_event_image"}, :dependent => :destroy
  belongs_to :host, :class_name => "User", :foreign_key => "host_id"
  has_many :tickets
  has_many :guests, :through => :tickets
  has_many :guests_waiting, :class_name => "Guest", :conditions => {:waiting => true}, :dependent => :destroy
  has_many :follows, :as => :followable, :dependent => :destroy
  has_many :post_event_comments, :as => :commentable, :class_name =>"Comment", :conditions => {:secondary_commentable_type => "post_event_comment"}, :dependent => :destroy
  has_many :post_event_media, :as => :imageable, :class_name =>"Image", :conditions => {:secondary_imageable_type => "post_event_media"}, :dependent => :destroy
  
  attr_accessible :other_info, :length, :cost, :date, :description, :menu_pdf, :menu_text, :people_limit, :title
  attr_accessible :host_id, :images_attributes, :time, :neighborhood, :blurb, :vegan, :vegetarian, :gluten_free, :blog_link, :upcoming

  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true

  #after_create :set_full_date

  #THIS WONT WORK BECAUSE WHAT IF EVENT DATE IS UPDATED!?
  
  #def set_full_date
  #  if date.present? && time.present?
  #    full_date=DateTime.new(date.year, date.month, date.day, time.hour, time.min time.sec)
  #  end
  #end

  def happened_events
    Event.where( event.date < today)
  end

  def approve!
    approved = true
    # send e-males
  end

  def seats_left
    people_limit - guests_count
  end

  def percent_full
    (guests_count/people_limit.to_f)*100
  end

  def guests_count
    if guests.loaded?
      guests.size
    else
      guests.count
    end
  end

  def guests_going
    if guests.loaded?
      guests
    else
      guests
    end
  end
  
  def waitlist
    guests_waiting
  end

  def waitlist_count
    if guests_waiting.loaded?
      guests_waiting.size
    else
      guests_waiting.count
    end
  end

  def happened?
    dt = DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec)+2
    if dt >= DateTime.now()
      false
    else
      true
    end
  end
end
