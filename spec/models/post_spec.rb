require 'rails_helper'

RSpec.describe Post, type: :model do
  
  describe 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should belong_to(:user) }
    it { should validate_uniqueness_of(:title).with_message("You can't have two posts with the same title.") }
  end

  it 'convert markdown to html' do
    post = Post.new(body: 'One **beautiful** post that *just* created!')
    expect(post.content_html).to include('<strong>beautiful</strong>')
    expect(post.content_html).to include('<em>just</em>')
  end

end