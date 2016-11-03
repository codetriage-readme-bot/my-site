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
    expect(rendered).to match(/The most important title/)
    expect(rendered).to match(/The body!/)
  end
end
