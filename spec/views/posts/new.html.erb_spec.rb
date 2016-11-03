require File.dirname(__FILE__) + '/../../spec_helper'

describe "posts/new.html.erb", type: :view do
  before(:each) do
    @post = Post.new(
      :id => 1
    )
  end

  it "render a form to create a post" do
    render
    expect(rendered).to have_selector("form",
      method: "post",
      action: post_path(@post.id)
    ) do |form|
      expect(form).to have_selector("input", type: "submit")
    end
  end
end
