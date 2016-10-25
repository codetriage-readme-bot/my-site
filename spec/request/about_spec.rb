describe "About Page" do
  describe "GET /about" do
    
    it "request success" do
      visit "/about"
      expect(page.status_code).to be(200)
    end
    
  end
end