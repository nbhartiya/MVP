class Accreditation < ActiveRecord::Base
  attr_accessible :agree, :experience, :individual_income, :joint_income, :net_worth
  
  belongs_to :user
end
