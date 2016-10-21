require File.dirname(__FILE__) + '/../spec_helper'

describe PostsController, type: :controller do
  describe "POST create" do
    it "creates a new post" do
      # post = mock_model(Post, :attributes= => true, :save => true).as_null_object
      # post = Post.new
      Post.should_receive(:new).
        with("title" => "The title 1", "body" => "must have").
        and_return(post)
      post :create, post: {"title" => "The title 1", "body" => "must have"}
    end

    it "saves the post" do
      post = mock_model(Post)
      Post.stub(:new).and_return(post)
      post.should_receive(:save)
      post :create
    end

    it "redirect to the Posts index" do
      post :create, post: {"title" => "The title 1", "body" => "must have"}
      response.should redirect_to(action: "show")
    end
  end
end
