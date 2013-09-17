require 'spec_helper'

describe Event,'validations' do
  it { should validate_presence_of(:location) }
end