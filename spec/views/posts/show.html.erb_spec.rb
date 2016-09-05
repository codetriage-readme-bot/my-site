require File.dirname(__FILE__) + '/../../spec_helper'

describe "posts/show.html.erb", type: :view do
  before(:each) do
    @post = Post.new(
      :id => 1,
      :title => "The most important title",
      :body => "The body!"
    )
  end

  it "displays the post with its body" do
    render
    rendered.should match(/The most important title/)
    rendered.should match(/The body!/)
  end
end
