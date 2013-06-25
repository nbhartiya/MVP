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
  attr_accessible :user_id

  belongs_to :followable, polymorphic: true
end
