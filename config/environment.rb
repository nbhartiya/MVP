# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MVP::Application.initialize!

# Specifying ActionMailer defailts for sending emails with SendGrid
ActionMailer::Base.smtp_settings = {
  :user_name => ENV["SENDGRID_USERNAME"],
  :password => ENV["SENDGRID_PASSWORD"],
  :domain => "mainstproject.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true,
  :openssl_verify_mode => 'none'
}