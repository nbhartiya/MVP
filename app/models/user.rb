# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  approved               :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  completed              :boolean          default(FALSE)
#  chef                   :boolean
#  points                 :text
#  phone                  :string(255)
#

class User < ActiveRecord::Base
  
  has_many :user_answers
  has_many :investments
  has_many :projects
  has_many :authentications, :dependent => :destroy
  has_one :accreditation
  has_many :locations
  # always do User.first.create_image instead of User.first.images.create!, but to destroy do User.first.image.destroy
  has_many :tickets
  # TODO: below relationship doesn't work...need to fix, do with the secondary field
  #has_many :events_attended, :class_name => "Event", :through => :guests
  has_many :events_hosted, :class_name => "Event", :foreign_key => "host_id"
  has_many :charges
  has_one :profile, :dependent => :destroy
  has_many :campaigns_started, :class_name => "Campaign", :foreign_key => "campaign_starter_id"
  # TODO:fixTHISMAYBEHASMANY
  has_many :host_to_campaigns, :class_name => "Campaign", :foreign_key => "host_id"
  # TODO:this below relationship will be complicated, come back to this...
  has_many :follows, :dependent => :destroy
  has_many :guests
  has_many :comments
  has_many :referral_codes
  
  after_create :confirmation_email, :do_mailchimp
  #before_create :chef_me
  
  serialize :points, Array
  
  def confirmation_email
    unless self.email.empty?
      if Rails.env.production?
        MandrillMailer.notify_us_of_user(self)
      end
      if self.chef?
        MandrillMailer.signup_chef_email(self)
      else
        MandrillMailer.signup_foodie_email(self)
      end
    end
  end

  def do_mailchimp
    if Rails.env.production?
      if !self.chef
        #gb = Gibbon::API.new
        begin
          r=Gibbon::API.lists.subscribe({:id => '8c1b490cc0', :email => {:email => self.email}, :merge_vars => {:FNAME => self.first_name, :LNAME => self.last_name}, :double_optin => false})
          puts "MAILCHIMP STATUS"
          puts r
        rescue Gibbon::MailChimpError => e
          puts e
        rescue StandardError => e
          puts e
        end
      end
    end
  end

  def events_attended
    attended_event_ids = self.guests.where(:waiting=>false).map(&:event_id)
    Event.where("id in (?)", attended_event_ids)
  end

  def future_events
    self.events_attended.where("date >= ? AND approved = ?", Date.today(), true)
  end

  def past_events
    self.events_attended.where("date < ? AND approved = ?", Date.today(), true)
  end

  def events_followed
    followed_event_ids = self.follows.where("followable_type = ?","Event").map(&:followable_id)
    Event.where("id in (?)",followed_event_ids)
  end

  def campaigns_followed
    followed_campaign_ids = self.follows.where("followable_type = ?","Campaign").map(&:followable_id)
    Campaign.where("id in (?)",followed_campaign_ids)
  end

  def users_followed
    followed_profile_ids = self.follows.where("followable_type = ?","Profile").map(&:followable_id)
    followed_profile_user_ids = Profile.where("id in (?)",followed_profile_ids).map(&:user_id)
    User.where("id in (?)",followed_profile_user_ids)
  end

  def foodies_followed
    self.users_followed.where("chef in (?)","false")
  end

  def businesses_followed
    self.users_followed.where("chef in (?)","true")
  end

  def followers
    following_user_ids=self.profile.follows.map(&:user_id)
    User.where("id in (?)",following_user_ids)
  end

  def business_followers
    self.followers.where("chef in (?)","true")
  end

  def foodie_followers
    self.followers.where("chef in (?)","false")
  end

  def follows_this?(type, fol_id)
    follow = Follow.where("followable_id = ? AND followable_type = ? AND user_id = ?",fol_id,type,self.id)
    if follow.present?
      return true
    else
      return false
    end
  end

  def attending?(event_id)
    attended_event_ids = self.events_attended
    return attended_event_ids.include? event_id
  end


  #def chef_me
  #  binding.pry
  #  if get_cookies.present?
  #    if self.chef == nil
  #      self.chef = get_cookies
  #      self.save!
  #    end
  #  end
  #end
  
  #ADD after_create thingie here! and the method to send email
  
  # is validation even doable unless there's a mainstreet username?
  # validates_uniqueness_of :email, :scope => [:first_name, :last_name]
  
  # validates_presence_of :kind
  
  # may need to change to has_and_belongs_to_many later on when multiple entrepreneurs are going to be logged in owning one project, will require a third table
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :approved, :first_name, :last_name, :chef, :work_zip, :points, :phone, :credit
  
  def apply_omniauth(omni, user_type)
    if omni['provider'] == 'facebook'
      self.email = omni['info']['email']
      self.first_name = omni['info']['first_name']
      self.last_name = omni['info']['last_name']
      #self.location = omni['info']['location']
    end
    # if omni['provider'] == 'linkedin'
    #   self.email = omni['info']['email']
    #   self.first_name = omni['info']['first_name']
    #   self.last_name = omni['info']['last_name']
    #   #self.location = omni['info']['location']
    # end
    # if omni['provider'] == 'twitter'
      # wahh twitter doesn't give you email address, so have to make sure my log in doesn't require that
    #   fullname = omni['info']['name'].split(' ')
    #   self.first_name, self.last_name = fullname[0], fullname[1]
    # end
    self.chef = user_type
    authentications.build(:provider => omni['provider'],
                          :uid => omni['uid'],
                          :token => omni['credentials']['token'])
  end

  
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.authentications.build(:provider => session['omni']['provider'],
                          :uid => session['omni']['uid'])
      end
    else
      super
    end
  end

  def facebook
    @graph = Koala::Facebook::API.new(self.authentications.find_by_provider('facebook').token)
  end
  
  def password_required?
    #false
    (authentications.empty? || !password.blank?) && super
  end
  
  def email_required?
    (authentications.empty? || authentications.first.provider != "twitter") && super
  end
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
  
  #not using at the moment
  def complete!
    self.completed = true
    save!
  end
  
  def get_total_points
    sum = 0
    points.each do |info|
      sum += info[1]
    end
    sum
  end
end