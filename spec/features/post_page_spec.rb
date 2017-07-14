require 'rails_helper'

feature 'post page' do
  scenario 'post title is present' do
    post = FactoryGirl.create(:post, title: 'Just did it')
    visit "/posts/#{post.id}"

    expect(page).to have_css('h1', text: 'Just did it')
  end

  scenario 'render markdown content' do
    post = FactoryGirl.create(:post, body: 'That *was* hard')
    visit "/posts/#{post.id}"

    expect(page).to have_css('em', text: 'was')
  end
end
