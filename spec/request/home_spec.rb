require 'spec_helper'

describe 'Home Page' do
  describe 'GET /' do
    
    before(:each) do
      visit '/'
    end
    
    it 'request success' do
      expect(page.status_code).to be(200)
    end
    
    describe 'musthead' do
      
      it 'has title' do
        expect(page).to have_selector 'h3', text:'RAMAN SKASKEVICH'
      end
      
      it 'has subtitle' do
        expect(page).to have_selector 'p', text:'SOFTWARE DEVELOPER & TESTER'
        expect(page).to have_selector 'p', text:'RUBY AMATEUR'
      end
      
    end
    
  end
end
