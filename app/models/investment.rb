class Investment < ActiveRecord::Base
  attr_accessible :amount, :project_id, :user_id
end
