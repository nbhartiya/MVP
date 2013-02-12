class Project < ActiveRecord::Base
  attr_accessible :description, :location, :logo, :min_investment, :name, :raised, :target, :terms, :user_id
end
