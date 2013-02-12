class Project < ActiveRecord::Base
  
  belongs_to :user
  has_many :investments
  
  attr_accessible :description, :location, :logo, :min_investment, :name, :raised, :target, :terms, :user_id
end
