# encoding: utf-8
# Autogenerated by the db:seed:dump task
# Do not hesitate to tweak this to your needs

campaign = Campaign.find_or_create_by_biz_name(:biz_name => "State Bird Provisions", :blurb => "James Beard best new restaurant (and the best meal I've ever had)!", :about => nil, :why_join => nil, :location_id => 5, :campaign_starter_id => 1, :host_id => nil, :successful => false, :expires => "2013-07-30")
campaign = Campaign.find_or_create_by_biz_name(:biz_name => "Ice Cream Bar", :blurb => "Old fashioned ice cream and soda parlor - mixed and made right in front of you!", :about => nil, :why_join => nil, :location_id => 6, :campaign_starter_id => 1, :host_id => nil,  :successful => false, :expires => "2013-07-28")
campaign = Campaign.find_or_create_by_biz_name(:biz_name => "Coffee Bar", :blurb => "You say cortahdo, I say cortaydo, all it is is excellent, excellent coffee", :about => nil, :why_join => nil, :location_id => 7, :campaign_starter_id => 1, :host_id => nil, :successful => false, :expires => "2013-07-29")
campaign = Campaign.find_or_create_by_biz_name(:biz_name => "SPQR", :blurb => "If food like what SPQR is making was around then, the Roman Empire would not have fallen (just downsized)", :about => nil, :why_join => nil, :location_id => 8, :campaign_starter_id => 1, :host_id => nil, :successful => false, :expires => "2013-08-08")

event = Event.find_or_create_by_title(:title => "Pie Shake Make", :people_limit => 35, :description => "Make pies with Chile Pies and Creamery", :menu_pdf => "http://www.nen.nl/pdfpreview/preview_68011.pdf", :menu_text => nil, :date => "2013-07-20", :cost => 35.0, :length => 120, :other_info => nil, :host_id => 4, :blurb => "it will be fun!", :time => "2000-01-01 16:00:00")
event = Event.find_or_create_by_title(:title => "Take a Breath", :people_limit => 30, :description => "Tea tasting with Jesse Jacobs, the tea guru behind Samovar", :menu_pdf => "http://www.nen.nl/pdfpreview/preview_68011.pdf", :menu_text => nil, :date => "2013-07-21", :cost => 40.0, :length => 90, :other_info => nil, :host_id => 2, :blurb => "Tea tasting and meditation", :time => "2000-01-01 10:00:00")
event = Event.find_or_create_by_title(:title => "Chronicles of Naan'ia", :people_limit => 30, :description => "Help develop a naan recipe with the founders of Tava", :menu_pdf => "http://www.nen.nl/pdfpreview/preview_68011.pdf", :menu_text => nil, :date => "2013-07-24", :cost => 40.0, :length => 150, :other_info => nil, :host_id => 3, :blurb => "There will be 'naan' left", :time => "2000-01-01 19:00:00")
event = Event.find_or_create_by_title(:title => "All the Fishes in the Sea", :people_limit => 50, :description => "Learn about sustainable seafood over a 4 course lunch near the Bay, all while supporting local fishermen!", :menu_pdf => "http://www.nen.nl/pdfpreview/preview_68011.pdf", :menu_text => nil, :date => "2013-07-27", :cost => 70.0, :length => 180, :other_info => nil, :host_id => 5, :blurb => "Dive into sustainable fishing over lunch", :time => "2000-01-01 12:00:00")

image = Image.find_or_create_by_image(:image => 'Food 6.jpg', :title => nil, :description => nil, :imageable_id => 1, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 2, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 3, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 4, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 5, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 6, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 7, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 8, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 9, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 10, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 11, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 12, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 13, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 14, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 15, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 16, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 17, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 18, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 19, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 20, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 21, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 22, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 23, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 24, :imageable_type => 'SurveyAnswer')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 5, :imageable_type => 'SurveyQuestion')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 5, :imageable_type => 'SurveyQuestion')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 6, :imageable_type => 'SurveyQuestion')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 6, :imageable_type => 'SurveyQuestion')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 7, :imageable_type => 'SurveyQuestion')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 7, :imageable_type => 'SurveyQuestion')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 8, :imageable_type => 'SurveyQuestion')
image = Image.find_or_create_by_image(:image => 'http://www.piyushpalace.com/images/organic-food-img1-big.jpg', :title => nil, :description => nil, :imageable_id => 8, :imageable_type => 'SurveyQuestion')

location = Location.find_or_create_by_address1(:address1 => "123 Mission St.", :address2 => nil, :city => "San Francisco", :state => "California", :zipcode => "94109", :user_id => 3, :event_id => 1, :neighborhood => "NoPa", :location_title => nil)
location = Location.find_or_create_by_address1(:address1 => "456 Market St.", :address2 => nil, :city => "San Francisco", :state => "California", :zipcode => "94122", :user_id => 2, :event_id => 2, :neighborhood => "SoMa", :location_title => nil)
location = Location.find_or_create_by_address1(:address1 => "789 2nd St.", :address2 => nil, :city => "San Francisco", :state => "California", :zipcode => "94104", :user_id => 4, :event_id => 3, :neighborhood => "Mission", :location_title => nil)
location = Location.find_or_create_by_address1(:address1 => "123 Union St.", :address2 => nil, :city => "San Francisco", :state => "California", :zipcode => "94109",:user_id => 5, :event_id => 4, :neighborhood => "Marina", :location_title => nil)
location = Location.find_or_create_by_address1(:address1 => "123 Fillmore St.", :address2 => nil, :city => "San Francisco", :state => "California", :zipcode => "94109", :user_id => nil, :event_id => nil, :neighborhood => "Japantown", :location_title => nil)
location = Location.find_or_create_by_address1(:address1 => "1492 Pacific Ave.", :address2 => nil, :city => "San Francisco", :state => "California", :zipcode => "94109", :user_id => nil, :event_id => nil, :neighborhood => "Nob Hill", :location_title => nil)

profile = Profile.find_or_create_by_user_id(:blurb => "the only thing better than pie or ice cream is pie AND ice cream", :location_id => nil, :story => nil, :home_zip => "94109", :work_zip => "94109", :user_id => 3,  :biz_name => "Chile Pies and Creamery", :yelp_id => nil, :neighborhood => "NoPa")
profile = Profile.find_or_create_by_user_id(:blurb => "I came, I saw, [I photographed], I ate", :location_id => 6, :story => nil, :home_zip => "94109", :work_zip => "94109", :user_id => 1, :biz_name => nil, :yelp_id => nil, :neighborhood => "Nob Hill")
profile = Profile.find_or_create_by_user_id(:blurb => "find peace in the middle of chaos", :location_id => nil, :story => nil, :home_zip => "94109", :work_zip => "94107", :user_id => 2, :biz_name => "Samovar Tea Lounge", :yelp_id => nil, :neighborhood => "SoMa")
profile = Profile.find_or_create_by_user_id(:blurb => "ask me about the burroti", :location_id => nil, :story => nil, :home_zip => "94122", :work_zip => "94109", :user_id => 3, :biz_name => "Tava", :yelp_id => nil, :neighborhood => "SoMa")
profile = Profile.find_or_create_by_user_id(:blurb => "plenty of fish in the sea (and need to keep it that way!)", :location_id => nil, :story => nil, :home_zip => "94109", :work_zip => "94109", :user_id => 4, :biz_name => "Fish", :yelp_id => nil, :neighborhood => "Marina")

surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 1, :text => 'established restaurants')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 1, :text => 'new restaurants')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 1, :text => 'food trucks/pop ups')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 1, :text => 'desserts & bakeries')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 1, :text => 'bars & nightlife')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 1, :text => 'coffee & tea')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 2, :text => 'Asian')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 2, :text => 'Mexican')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 2, :text => 'Italian')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 2, :text => 'French')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 2, :text => 'American (traditional)')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 2, :text => 'American (new)')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 3, :text => 'Foreign Cinema')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 3, :text => 'Sushirrito')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 3, :text => 'Chez Panisse')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 3, :text => 'Lazy Bear')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 3, :text => 'Radio Africa Kitchen')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 3, :text => 'Mission Chinese')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 4, :text => 'Tea Tasting with Samovar')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 4, :text => 'Naan Making with Tava')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 4, :text => 'Farm to Table Meal with Hillside Supper Club')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 4, :text => 'Sustainable Seafood Dinner with Fish')
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 4, :text => "Cocktail Making with Capo's")
surveyAnswer = SurveyAnswer.find_or_create_by_text(:survey_question_id => 4, :text => "Pizza Making with Tony's Pizza")

surveyQuestion = SurveyQuestion.find_or_create_by_question(:for_chef => false, :question => 'Which 3 of the below categories of food/drink are you most interested in?', :topic => nil, :low_extreme => nil, :high_extreme => nil, :format => 'option', :active => true)
surveyQuestion = SurveyQuestion.find_or_create_by_question(:for_chef => false, :question => 'Which cuisines do you like the most?', :topic => nil, :low_extreme => nil, :high_extreme => nil, :format => 'option', :active => true)
surveyQuestion = SurveyQuestion.find_or_create_by_question(:for_chef => false, :question => 'Which 3 of the below restaurants would you be MOST likely to go to?', :topic => nil, :low_extreme => nil, :high_extreme => nil, :format => 'option', :active => true)
surveyQuestion = SurveyQuestion.find_or_create_by_question(:for_chef => false, :question => 'Which 3 of the below events would you be MOST excited to attend?', :topic => nil, :low_extreme => nil, :high_extreme => nil, :format => 'option', :active => true)
surveyQuestion = SurveyQuestion.find_or_create_by_question(:for_chef => false, :question => 'Which type of event would you be most excited about?', :topic => nil, :low_extreme => "so hands off it's like I'm watching TV", :high_extreme => "so hands on I better wear an apron", :format => 'slider', :active => true)
surveyQuestion = SurveyQuestion.find_or_create_by_question(:for_chef => false, :question => 'Which type of event would you be most excited about?', :topic => nil, :low_extreme => "so small it's like a date between me and the chef", :high_extreme => "so big everybody's here. and their moms. and dads. and second cousins from Georgia", :format => 'slider', :active => true)
surveyQuestion = SurveyQuestion.find_or_create_by_question(:for_chef => false, :question => 'Which type of event would you be most excited about?', :topic => nil, :low_extreme => "so impossible to get into I needed an invite to my own party. and still bribed the bouncer", :high_extreme => "so easy to get into that I walked in without a shirt", :format => 'slider', :active => true)
surveyQuestion = SurveyQuestion.find_or_create_by_question(:for_chef => false, :question => 'What is the maximum you would pay for a cool event?', :topic => nil, :low_extreme => '$10', :high_extreme => '$250', :format => 'slider', :active => true)
