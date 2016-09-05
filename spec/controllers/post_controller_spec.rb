require File.dirname(__FILE__) + '/../spec_helper'

describe PostsController do
  describe "POST create" do
    it "creates a new post" do
      Post.should_receive(:new).with("title" => "The title 1")
      post :create, post: {"title" => "The title 1"}
    end

    it "saves the post"
  end
end
