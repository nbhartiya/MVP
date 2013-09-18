# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  commentable_type :string(255)
#

class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :secondary_commentable_type
  
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
end
