require 'spec_helper'

describe "forums/edit.html.erb" do
  before(:each) do
    @forum = assign(:forum, stub_model(Forum,
      :title => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit forum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => forums_path(@forum), :method => "post" do
      assert_select "input#forum_title", :name => "forum[title]"
      assert_select "input#forum_user_id", :name => "forum[user_id]"
    end
  end
end
