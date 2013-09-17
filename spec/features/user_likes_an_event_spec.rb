require 'spec_helper'

feature 'user can like an event', js: true do
	scenario 'user successfully likes an event if not logged in' do
	  event = create(:event, title: 'Pie Shake Make')
	  visit(event_path(event))
	  save_and_open_page
	  within ".icons" do
	    click_link ".sb .heart .circle .no-border .no-shadow .follow .foodiesignup"
	  end
	  page.should have_css(".sb .heart .circle .no-border .no-shadow .follow .foodiesignup .orange")
	end

	def sign_in
	  click_link "sign in"
	  click_link "log in with email"
      user = create(:user)
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log In'
    end
end	