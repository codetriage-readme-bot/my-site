describe "Projects Page" do
  describe "GET /projects" do
    
    before(:each) do
      visit "/projects"
    end
    
    it "request success" do
      expect(page.status_code).to be(200)
    end
    
    describe "musthead" do
      
      it "has title" do
        expect(page).to have_selector 'h2', text: "Projects"
      end
      
      it "has project romasks" do
        expect(page).to have_selector 'strong', text: "romasks"
      end
      
      it "has project oldtree" do
        expect(page).to have_selector 'strong', text: "oldtree"
      end
      
      it "has project hairdo-mysql" do
        expect(page).to have_selector 'strong', text: "hairdo-mysql"
      end
      
    end
    
  end
end