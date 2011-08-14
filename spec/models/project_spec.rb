require 'spec_helper'

describe Project do

  before(:each) do
    @user = Factory(:user)
    @attr = { :name => "name", :project_type => "type" }
  end

  it "should create a new instance given valid attributes" do
    @user.projects.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @project = @user.projects.create(@attr)
    end

    it "should have a user attribute" do
      @project.should respond_to(:user)
    end

    it "should have the right associated user" do
      @project.user_id.should == @user.id
      @project.user.should == @user
    end
  end
describe "validations" do

    it "should require a user id" do
      Project.new(@attr).should_not be_valid
    end

    it "should require nonblank name" do
      @user.projects.build(:name => "  ").should_not be_valid
    end
    it "should require nonblank project_type" do
      @user.projects.build(:project_type => "  ").should_not be_valid
    end

    it "should reject long name" do
      @user.projects.build(:name => "a" * 26).should_not be_valid
    end
    it "should reject long project_type" do
      @user.projects.build(:project_type => "a" * 11).should_not be_valid
    end
  end
end