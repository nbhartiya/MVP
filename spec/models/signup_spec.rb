# == Schema Information
#
# Table name: signups
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  chef       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Signup,'validations' do
	it { should validate_uniqueness_of(:email).with_message(/You've signed up with us already!/) }
	#WAH: ADD MORE LATER!
end
