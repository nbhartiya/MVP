# == Schema Information
#
# Table name: campaigns
#
#  id                  :integer          not null, primary key
#  biz_name            :string(255)
#  blurb               :text
#  about               :text
#  why_join            :text
#  location_id         :integer
#  campaign_starter_id :integer
#  host_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  successful          :boolean
#  expires             :date
#

require 'spec_helper'

describe Campaign do
  pending "add some examples to (or delete) #{__FILE__}"
end
