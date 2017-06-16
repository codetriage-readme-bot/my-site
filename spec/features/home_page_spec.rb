require 'rails_helper'

feature 'home page' do
	scenario 'welcome message' do
		visit '/'
		within(".panel-body") do
			expect(page).to have_content 'Welcome'
		end
	end
end