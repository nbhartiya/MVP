# == Schema Information
#
# Table name: profiles
#
#  id          :integer          not null, primary key
#  blurb       :text
#  location_id :integer
#  story       :text
#  home_zip    :string(255)
#  work_zip    :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Profile do
  pending "add some examples to (or delete) #{__FILE__}"
end
