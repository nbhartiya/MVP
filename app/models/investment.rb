# == Schema Information
#
# Table name: investments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Investment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :project
  
  attr_accessible :amount, :project_id, :user_id
end
