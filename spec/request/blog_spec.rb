describe "Blog Page" do
  describe "GET /posts" do
    
    it "request success" do
      visit "/posts"
      expect(page.status_code).to be(200)
    end
    
  end
end