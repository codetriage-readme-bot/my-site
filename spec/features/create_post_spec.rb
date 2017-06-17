require 'rails_helper'

feature 'create_new_post' do
	let(:btn_new) { btn_new = 'Create New One' }
	let(:btn_create) { btn_new = 'Create Post' }

	scenario 'create new post with valid data' do
		visit '/posts'
		click_on(btn_new)

		fill_in('Title', with: 'Make a Post')
		fill_in('Body', with: 'Post content')
		click_on(btn_create)

		within(".flash-container") do
			expect(page).to have_content 'Post was successfully created.'
		end
		expect(Post.last.title).to eq('Make a Post')
	end

	scenario 'create new post with invalid data' do
		visit '/posts'
		click_on(btn_new)

		click_on(btn_create)

		within(".errors-container") do
			msg_expect = "2 errors prevented this Post from saving"
			expect(page).to have_content(msg_expect)
			expect(page).to have_content('can\'t be blank')
		end
	end
end