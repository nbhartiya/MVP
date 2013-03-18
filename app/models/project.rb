# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  name           :string(255)
#  logo           :string(255)
#  location       :text
#  description    :text
#  target         :integer
#  raised         :integer
#  terms          :text
#  min_investment :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  business_plan  :string(255)
#  category       :string(255)
#  approved       :boolean
#

class Project < ActiveRecord::Base
  
  belongs_to :user
  has_many :investments
  
  attr_accessible :description, :location, :logo, :min_investment, :name, :raised, :target, :terms, :user_id
end
