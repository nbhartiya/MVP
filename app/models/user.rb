# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  kind                   :string(255)
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
#  work_zip               :string(255)
#

class User < ActiveRecord::Base
  
  has_many :user_answers
  has_many :investments
  has_many :projects
  has_many :authentications
  has_one :accreditation
  has_one :location
  has_one :image, :as => :imageable
  # always do User.first.create_image instead of User.first.images.create!, but to destroy do User.first.image.destroy
  has_many :tickets
  has_many :events_attended, :class_name => "Event", :through => :tickets
  has_many :events_hosted, :class_name => "Event", :foreign_key => "host_id"
  
  before_create :confirmation_email
  
  def confirmation_email
    NotificationMailer.signup_email(self).deliver
  end
  
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
  attr_accessible :approved, :first_name, :last_name, :kind, :work_zip
  
  def apply_omniauth(omni)
    if omni['provider'] == 'facebook'
      self.email = omni['info']['email']
      self.first_name = omni['info']['first_name']
      self.last_name = omni['info']['last_name']
      #self.location = omni['info']['location']
    end
    if omni['provider'] == 'linkedin'
      self.email = omni['info']['email']
      self.first_name = omni['info']['first_name']
      self.last_name = omni['info']['last_name']
      #self.location = omni['info']['location']
    end
    if omni['provider'] == 'twitter'
      # wahh twitter doesn't give you email address, so have to make sure my log in doesn't require that
      fullname = omni['info']['name'].split(' ')
      self.first_name, self.last_name = fullname[0], fullname[1]
    end
    authentications.build(:provider => omni['provider'],
                          :uid => omni['uid'])
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
  
end
