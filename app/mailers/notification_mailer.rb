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
end