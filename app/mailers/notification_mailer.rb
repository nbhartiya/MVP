class NotificationMailer < ActionMailer::Base
  
  include SendGrid
  default :from => "neeharika@simmr.co"

  def signup_foodie_email(user)
   @user = user
    mail( :to => user.email,
    :subject => "Welcome to Simmr, #{user.first_name} #{user.last_name}!")
  end

  def signup_chef_email(user)
    @user = user
    mail( :to => user.email,
    :subject => "Welcome to Simmr, #{user.first_name} #{user.last_name}!")
  end

  def waitlist_email(signup)
    @signup = signup
    mail( :to => signup.email,
    :subject => "You're on Your Way to Some of the Best Meals of Your Life!")
  end
  
  def waitlist_chef_email(signup)
    @signup = signup
    mail( :to => signup.email,
    :subject => "You're on Your Way to Sharing Your Food with the World")
  end

  def notify_us_of_user_signup(user)
    @user = user
    if !user.chef.nil?
      if user.chef=true
        @type="CHEF"
      else
        @type="FOODIE"
      end
    else
      @type="USER (cant tell chef or foodie)"
    end
    if user.first_name.present? && user.last_name.present?
      mail(:to=>"neeharika.b@gmail.com", :subject=>"NEW SIMMR #{@type}: #{user.first_name} #{user.last_name}")
    else
      mail(:to=>"neeharika.b@gmail.com", :subject=>"NEW SIMMR #{@type}, id: #{user.id}, but didnt catch name")
    end
  end
end