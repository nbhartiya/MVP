require 'spec_helper'

describe Signup,'validations' do
	it { should validate_uniqueness_of(:email).with_message(/You've signed up with us already!/) }
	#TODO: ADD MORE LATER!
end