require 'spec_helper'

feature 'Signups' do
	scenario 'User visits new signup page' do
		visit(root_path)
		expect(page).to have_content 'SIGN UP'
		page.has_field?('signup_email')
	end
end