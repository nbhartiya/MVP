# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  image          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  title          :string(255)
#  description    :text
#  imageable_id   :integer
#  imageable_type :string(255)
#

class Image < ActiveRecord::Base
  attr_accessible :image, :title, :description
  
  belongs_to :imageable, :polymorphic => true, :dependent => :destroy
end
