module EventsHelper

include Yelp::V2::Business::Request
# retrieve details of business vi yelp business id

def search_business_id(profile)
end

def get_review_count(profile)
	client = Yelp::Client.new

	request = Id.new(
		:yelp_business_id => profile.yelp_id,
		:consumer_key => ENV["YELP_CONSUMER_KEY"],
		:consumer_secret => ENV["YELP_CONSUMER_SECRET"],
		:token => ENV["YELP_TOKEN"],
		:token_secret => ENV["YELP_TOKEN_SECRET"])
	response=client.search(request)
	reviewCount=response.fetch("review_count")
	return reviewCount
end

def get_yelp_link(profile)
	client = Yelp::Client.new

	request = Id.new(
		:yelp_business_id => profile.yelp_id,
		:consumer_key => ENV["YELP_CONSUMER_KEY"],
		:consumer_secret => ENV["YELP_CONSUMER_SECRET"],
		:token => ENV["YELP_TOKEN"],
		:token_secret => ENV["YELP_TOKEN_SECRET"])
	response=client.search(request)
	yelpUrl=response.fetch("url")
	return yelpUrl
end

def get_yelp_rating_img_url(profile)
	client = Yelp::Client.new

	request = Id.new(
		:yelp_business_id => profile.yelp_id,
		:consumer_key => ENV["YELP_CONSUMER_KEY"],
		:consumer_secret => ENV["YELP_CONSUMER_SECRET"],
		:token => ENV["YELP_TOKEN"],
		:token_secret => ENV["YELP_TOKEN_SECRET"])
	response=client.search(request)
	yelpRatingUrl=response.fetch("rating_img_url_small")
	return yelpRatingUrl
end

end
