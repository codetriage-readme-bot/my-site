require 'rails_helper'

RSpec.describe "pics/new", type: :view do
  before(:each) do
    assign(:pic, Pic.new(
      :title => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders new pic form" do
    render

    assert_select "form[action=?][method=?]", pics_path, "post" do

      assert_select "input#pic_title[name=?]", "pic[title]"

      assert_select "textarea#pic_description[name=?]", "pic[description]"

      assert_select "input#pic_user_id[name=?]", "pic[user_id]"
    end
  end
end
