#require File.dirname(__FILE__) + '/../spec_helper'

describe Post do
  before(:each) do
    @post = Post.new(:title => "The most important title", :body => "The body!")
  end

  it "should be true" do
    expect(true).to be true
  end

  it "is valid with valid attributes" do
    expect(@post).to be_valid
  end

  it "is not valid without a title" do
    @post.title = nil
    expect(@post).not_to be_valid
  end

  it "is not valid when the title has less then 10 characters" do
    @post.title = "Post"
    expect(@post).not_to be_valid
  end

  it "is not valid without a body" do
    @post.body = nil
    expect(@post).not_to be_valid
  end

end
