class User < ActiveRecord::Base
  
  has_many :user_answers
  has_many :investments
  has_many :projects
  has_many :authentications
  
  # is validation even doable unless there's a mainstreet username?
  # validates_uniqueness_of :email, :scope => [:first_name, :last_name]
  
  # validates_presence_of :kind
  
  # may need to change ot has_and_belongs_to_many later on when multiple entrepreneurs are going to be logged in owning one project, will require a third table
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :approved, :first_name, :last_name, :kind
  
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
        user.valid?
      end
    else
      super
    end
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
  
  def complete!
    self.completed = true
    save!
  end
  
end
