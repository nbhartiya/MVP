class Investment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :project
  
  attr_accessible :amount, :project_id, :user_id
end
