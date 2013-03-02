class Authentication < ActiveRecord::Base
  belongs_to :user
  
  # Q for Michael: is it safe to make token and token_secret accessible attributes?
  attr_accessible :user_id, :provider, :uid, :token, :token_secret
  
end
