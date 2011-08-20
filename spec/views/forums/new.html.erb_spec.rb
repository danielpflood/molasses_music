require 'spec_helper'

describe "forums/new.html.erb" do
  before(:each) do
    assign(:forum, stub_model(Forum,
      :title => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new forum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => forums_path, :method => "post" do
      assert_select "input#forum_title", :name => "forum[title]"
      assert_select "input#forum_user_id", :name => "forum[user_id]"
    end
  end
end
