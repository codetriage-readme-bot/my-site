describe "About Page" do
  describe "GET /about" do
    
    before (:each) do
      visit "/about"
    end
    
    it "request success" do
      expect(page.status_code).to be(200)
    end
    
    describe "musthead" do
      
      it "has title" do
        expect(page).to have_selector 'h2', text: "About Me"
      end
      
      it "has name" do
        expect(page).to have_selector 'strong', text: "Raman Skaskevich"
      end
      
      it "has link to wiki"
      
      it "has link to Ericpol page" do
        #expect(page).to click_link('Ericsson Ericpol').redirect_to('http://www.ericpol.com/')
      end
      
      it "has link to projects page"
      
    end
    
  end
end