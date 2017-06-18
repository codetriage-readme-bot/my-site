require 'rails_helper'
require_relative '../support/new_post_form.rb'

feature 'create_new_post' do
	let(:new_post_form) { NewPostForm.new }

	scenario 'create new post with valid data' do
		new_post_form.visit_page.fill_in_with(
			title: 'The Post'
		).submit

		expect(page).to have_css('.alert', text: 'Post was successfully created.')
		expect(Post.last.title).to eq('The Post')
	end

	scenario 'create new post with invalid data' do
		new_post_form.visit_page.submit

		expect(page).to have_css('errors', text: '2 errors prevented this Post from saving')
		expect(page).to have_css('errors', text: 'can\'t be blank')
	end
end