module Points

class WorthPoints
# interface for any activity worth points
# all implementations of this interface must implement a way to prove the activity was carried out
  attr_reader :name
  def prove(user)
      true
  end
end

class Survey < WorthPoints
      def initialize
      	  @name = :survey
      end
end

class RateEvent < WorthPoints
      def initialize
      	  @name = :rate_event
      end
end

class AttendEvent < WorthPoints
      def initialize
      	  @name = :attend_event
      end
end

class ReferToSignup < WorthPoints
      def initialize
      	  @name = :refer_signup
      end
end

class ReferToEvent < WorthPoints
      def initialize
      	  @name = :refer_event
      end
end

class Review < WorthPoints
      def initialize
      	  @name = :review
      end
end

class StartCampaign < WorthPoints
      def initialize
      	  @name = :start_campaign
      end
end

class PointsSystem
# returns number of points for each activity type
# TODO: nkulkarni improve this so we look in the DB 
# for now use harcoded in-memory hash, we only have a few types
  @@points_hash = {    :rate_event => 1, 
  		       :survey => 2, 
		       :attend_event => 3, 
		       :refer_signup => 4,
		       :refer_event => 4, 
		       :review => 5,
		       :start_campaign => 1
		   }

  def self.points_for(activity_type)
      @@points_hash[activity_type.name]
  end
end

class PointsAwarder

      attr_reader :activity_type

      def initialize(activity_type)
      	  @activity_type = activity_type
      end

      def award(user, activity)
	  if @activity_type.prove user
	     # TODO: nkulkarni obviously we may want to store more detailed info here
	     # could be useful to have a way of tracking down the exact activity points were assigned for
	     num_points = Points::PointsSystem.points_for @activity_type
	     user.points << [@activity_type.name, num_points]
	  else
		nil
	  end
      end
end

end