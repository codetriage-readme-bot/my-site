require 'rails_helper'

feature 'home page' do

  scenario 'click pics link' do
    visit '/pics'
  end

end