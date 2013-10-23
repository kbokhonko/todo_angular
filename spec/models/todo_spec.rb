require 'spec_helper'

describe Todo do

  before(:all) do
    @attr = { :content => "Example", :done => :false }
  end

  it "should create a new instance given valid attributes" do
    Todo.create!(@attr)
  end

  it "should require a content" do
    no_content = Todo.new(@attr.merge(:content => ""))
    no_content.should_not be_valid
  end

  it "should require a long of content" do
 	  short_content = "a"
 	  short_content_todo = Todo.new(@attr.merge(:content => short_content))
 	  short_content_todo.should_not be_valid
  end
end