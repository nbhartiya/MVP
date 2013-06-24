FactoryGirl.define do
	factory :user do
		sequence :email do |n|
      "person#{n}@example.com"
    end
		password 'examplePass'
	end
	factory :host, parent: :user do
		first_name 'Martha'
		last_name 'Stewart'
	end
	factory :event do
		host {create(:host)}
		people_limit 23
		date (Date.today+1.week)
	end
end