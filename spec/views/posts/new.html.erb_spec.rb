require 'rails_helper'

#showing new posts

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :name => "MyString",
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_name[name=?]", "post[name]"

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post_body[name=?]", "post[body]"
    end
  end
end
