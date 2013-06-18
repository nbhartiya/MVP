FactoryGirl.define do
	factory :event do
	end
	factory :user do
		email 'something@example.com'
		password 'examplePass'
	end
end