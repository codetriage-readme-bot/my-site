describe "Projects Page" do
  describe "GET /projects" do
    
    it "request success" do
      visit "/projects"
      expect(page.status_code).to be(200)
    end
    
  end
end