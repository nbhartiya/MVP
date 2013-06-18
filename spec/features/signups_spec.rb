require 'spec_helper'

feature 'Signups' do
	scenario 'User visits new signup page' do
		visit(root_path)
		expect(page).to have_content 'SIGN UP'
		page.has_field?('signup_email')
		page.has_field?('signup_chef')
		expect(page).to have_content 'How It Works'
		expect(page).to have_content 'Team and Jobs'
		expect(page).to have_content 'Contact Us'
	end
	scenario 'User submits a blank email in Sign Up field' do
		visit(root_path)
	end
end