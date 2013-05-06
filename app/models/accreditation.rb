# == Schema Information
#
# Table name: accreditations
#
#  id                :integer          not null, primary key
#  individual_income :string(255)
#  joint_income      :string(255)
#  net_worth         :string(255)
#  experience        :boolean
#  agree             :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Accreditation < ActiveRecord::Base
  attr_accessible :agree, :experience, :individual_income, :joint_income, :net_worth
  
  belongs_to :user
end
