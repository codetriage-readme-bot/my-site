require 'rails_helper'

feature 'home page' do
	context 'within panel-body' do
		scenario 'welcome message' do
			visit '/'
			within(".panel-body") do
				expect(page).to have_content 'Welcome'
			end
		end

		scenario 'author name' do
			visit '/'
			within(".panel-body") do
				expect(page).to have_content 'Raman Skaskevich'
			end
		end

		scenario 'job role' do
			visit '/'
			within(".panel-body") do
				expect(page).to have_content 'Software Developer'
			end
		end

		scenario 'Rails skill' do
			visit '/'
			within(".panel-body") do
				expect(page).to have_content 'Rails'
			end
		end

		scenario 'Android skill' do
			visit '/'
			within(".panel-body") do
				expect(page).to have_content 'Android'
			end
		end
	end

	context 'within panel-footer' do
		scenario 'contact message' do
			visit '/'
			within(".panel-footer") do
				expect(page).to have_content 'Contact to me'
			end
		end

		scenario 'mail contact' do
			visit '/'
			within(".panel-footer") do
				expect(page).to have_content 'lusersks@gmail.com'
			end
		end

		scenario 'twitter contact' do
			visit '/'
			within(".panel-footer") do
				expect(page).to have_content '@romasks'
			end
		end

		scenario 'github contact' do
			visit '/'
			within(".panel-footer") do
				expect(page).to have_content 'GitHub Account'
			end
		end

		scenario 'skype contact' do
			visit '/'
			within(".panel-footer") do
				expect(page).to have_content 'Skype: romasks'
			end
		end
	end	
end