require 'rails_helper'

RSpec.describe "pics/edit", type: :view do
  before(:each) do
    @pic = assign(:pic, Pic.create!(
      :title => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit pic form" do
    render

    assert_select "form[action=?][method=?]", pic_path(@pic), "post" do

      assert_select "input#pic_title[name=?]", "pic[title]"

      assert_select "textarea#pic_description[name=?]", "pic[description]"

      assert_select "input#pic_user_id[name=?]", "pic[user_id]"
    end
  end
end
