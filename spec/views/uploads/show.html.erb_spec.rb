require 'spec_helper'

describe "uploads/show.html.erb" do
  before(:each) do
    @upload = assign(:upload, stub_model(Upload))
  end

  it "renders attributes in <p>" do
    render
  end
end
