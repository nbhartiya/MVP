# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  ticket_id  :integer
#  event_id   :integer
#  user_id    :integer
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  charge_id  :integer
#

class Guest < ActiveRecord::Base
  attr_accessible :email, :event_id, :first_name, :user_id, :last_name, :ticket_id, :token, :charge_id, :waiting

  belongs_to :ticket
  belongs_to :charge
  belongs_to :user
  belongs_to :event

  after_create :do_mailchimp_guest

  def do_mailchimp_guest
    if true #Rails.env.production?
  	  if self.user_id==nil
  	    #gb = Gibbon::API.new
        begin
          Gibbon::API.lists.subscribe({:id => '8c1b490cc0', :email => {:email => self.email}, :merge_vars => {:FNAME => self.first_name, :LNAME => self.last_name, :GUEST => 'Guest'}, :double_optin => false})
        rescue Gibbon::MailChimpError => e
          #email us
          puts e
        rescue StandardError => e
          puts e
        end
      end
    end
  end
end
