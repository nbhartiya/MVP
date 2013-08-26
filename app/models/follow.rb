# == Schema Information
#
# Table name: follows
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  followable_id   :integer
#  followable_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Follow < ActiveRecord::Base
  #TODO: need to make followable_id and followable_type accessible just to the follow create controller..
  attr_accessible :user_id, :followable_id, :followable_type

  belongs_to :followable, polymorphic: true
  belongs_to :user
end
