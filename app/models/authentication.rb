# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  token      :string(255)
#

class Authentication < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :user_id, :provider, :uid, :token
  cattr_accessor :chef_info
  
end
