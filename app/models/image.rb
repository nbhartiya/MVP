class Image < ActiveRecord::Base
  attr_accessible :image, :title, :description
  
  belongs_to :imageable, :polymorphic => true
end
