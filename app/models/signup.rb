# == Schema Information
#
# Table name: signups
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  chef       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Signup < ActiveRecord::Base
  after_create :signup_email, :notify_us, :do_mailchimp

  attr_accessible :email, :chef
  
  # Makeshift email validation for now
  validates :email, :presence => true,
    :length => {:minimum => 3, :maximum => 254},
    :uniqueness => {:message => "You've signed up with us already!"},
    :format => /@/
  
  def signup_email
    MandrillMailer.signup_generic_email(self)
    #if self.chef?
    #  NotificationMailer.waitlist_chef_email(self).deliver
    #else
    #  NotificationMailer.waitlist_email(self).deliver
    #end
  end

  def notify_us
    MandrillMailer.notify_us_of_signup(self)
  end

  def do_mailchimp
    if Rails.env.production?
      #gb = Gibbon::API.new
      begin
        r=Gibbon::API.lists.batch_subscribe(:id => '8c1b490cc0', :batch => [{:email => {:email => self.email}, :merge_vars => {:USER => 'false'}}],:double_optin => false, :update_existing => true)
        puts "MAILCHIMP"
        puts r
      rescue Gibbon::MailChimpError => e
        puts "ERROR1"
        puts e
      rescue StandardError => e
        puts "ERROR2"
        puts e
      end
    end
  end
end
