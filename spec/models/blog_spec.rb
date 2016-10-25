describe Post do
  
  let(:post) { Post.new(title:"Post with correct title",
                        body:"And some body!") }
  
  describe "attributes" do
  
    it { expect(post).to validate_presence_of :title }
    it { expect(post).to validate_presence_of :body }
    
    it do
      expect(post).to validate_length_of(:title).
        is_at_least(10).
        with_message("title must have at least 10 characters")
    end
    it do
      expect(post).to validate_length_of(:title).
        is_at_most(100).
        with_message("title must have at most 100 characters")
    end
  
    it "saves attributes" do
      post.save!
      expect(post).to be_valid
    end
  
  end
  
end