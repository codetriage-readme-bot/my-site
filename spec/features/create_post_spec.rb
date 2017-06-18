require 'rails_helper'

feature 'create_new_post' do
	scenario 'create new post with valid data' do
		visit '/posts'
		click_on('Create New One')

		fill_in('Title', with: 'Make a Post')
		fill_in('Body', with: 'Post content')
		click_on('Create Post')

		within(".flash-container") do
			expect(page).to have_content 'Post was successfully created.'
		end
		expect(Post.last.title).to eq('Make a Post')
	end

	scenario 'create new post with invalid data' do
		visit '/posts'
		click_on('Create New One')

		click_on('Create Post')

		within(".errors-container") do
			msg_expect = "2 errors prevented this Post from saving"
			expect(page).to have_content(msg_expect)
			expect(page).to have_content('can\'t be blank')
		end
	end
end