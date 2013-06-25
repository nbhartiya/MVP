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

require 'spec_helper'

describe Follow do
  pending "add some examples to (or delete) #{__FILE__}"
end
