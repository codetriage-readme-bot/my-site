require 'rails_helper'

feature 'home page' do
  context 'within panel-body' do
    scenario 'welcome message' do
      visit '/'
      expect(page).to have_css('.panel-body', text: 'Welcome')
    end

    scenario 'author name' do
      visit '/'
      expect(page).to have_css('.panel-body', text: 'Raman Skaskevich')
    end

    scenario 'job role' do
      visit '/'
      expect(page).to have_css('.panel-body', text: 'Software Developer')
    end

    scenario 'Rails skill' do
      visit '/'
      expect(page).to have_css('.panel-body', text: 'Rails')
    end

    scenario 'Android skill' do
      visit '/'
      expect(page).to have_css('.panel-body', text: 'Android')
    end
  end

  context 'within panel-footer' do
    scenario 'contact message' do
      visit '/'
      expect(page).to have_css('.panel-footer', text: 'Contact to me')
    end

    scenario 'mail contact' do
      visit '/'
      expect(page).to have_css('.panel-footer', text: 'lusersks@gmail.com')
    end

    scenario 'twitter contact' do
      visit '/'
      expect(page).to have_css('.panel-footer', text: '@romasks')
    end

    scenario 'github contact' do
      visit '/'
      expect(page).to have_css('.panel-footer', text: 'GitHub Account')
    end

    scenario 'skype contact' do
      visit '/'
      expect(page).to have_css('.panel-footer', text: 'Skype: romasks')
    end
  end
end
