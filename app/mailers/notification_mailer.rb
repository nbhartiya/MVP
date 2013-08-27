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
    :subject => "You're on Your Way to Sharing Your Food with the World!")
  end
end