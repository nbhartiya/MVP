# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  full_name   :string(255)
#  last4       :string(255)
#  user_id     :integer
#  token       :string(255)
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Charge do
  pending "add some examples to (or delete) #{__FILE__}"
end
