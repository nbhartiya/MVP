class User < ActiveRecord::Base
  
  has_many :user_answers
  has_many :investments
  has_many :projects
  has_many :authentications
  
  # Will need to require user type (entrepreneur or investor) later with something along the lines of "validates_presence_of :field"
  
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
      self.email = omni['extra']['raw_info']['email']
      self.first_name = omni['extra']['raw_info']['first_name']
      self.last_name = omni['extra']['raw_info']['last_name']
    end
    # Token_Secret doesn't seem to populate with the code below and is not on the omni hash...
    # Need to look up how to get token secret to go into authentication...wondering, is it really necessary?
    binding.pry
    authentications.build(:provider => omni['provider'],
                          :uid => omni['uid'],
                          :token => omni['credentials'].token,
                          :token_secret => omni['credentials'].secret)
  end
  
  def password_required?
    #Basically says, if there is something in authentication and the password is blank, don't require password
    (authentications.empty? & password.blank?) && super
  end
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
  
end
