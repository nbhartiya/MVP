require 'test_helper'

SURVEY_POINTS = 2
CAMPAIGN_POINTS = 1
class PointsAwarderTest < MiniTest::Unit::TestCase
      include Points
      def test_award_points
      	  user = create_user_with_points_storage "Harry Potter", 1234
	  survey = Survey.new
	  sut = PointsAwarder.new survey
	  assert_equal(survey, sut.activity_type)
	  
	  sut.award user, survey
	  assert_equal(1, user.points.length)
	  assert_equal([:survey, SURVEY_POINTS], user.points[0])

	  campaign = StartCampaign.new
	  sut = PointsAwarder.new campaign
	  sut.award user, campaign
	  assert_equal(2, user.points.length)
	  assert_equal([:survey, SURVEY_POINTS], user.points[0])
	  assert_equal([:start_campaign, CAMPAIGN_POINTS], user.points[1])
      end
end