class NotificationMailer < ActionMailer::Base
  
  include SendGrid
  
  default :from => "hello@mainstproject.com"

  def signup_email(user)
    @user = user
    mail( :to => user.email,
    :subject => "Welcome #{user.email}!")
  end
  
  def waitlist_email(signup)
    @signup = signup
    mail( :to => signup.email,
    :subject => "You're on Your Way to Some of the Best Meals of Your Life!")
  end
  
  def waitlist_chef_email(signup)
    @signup = signup
    mail( :to => signup.email,
    :subject => "You're on Your Way to Simple Livin'!")
  end
end