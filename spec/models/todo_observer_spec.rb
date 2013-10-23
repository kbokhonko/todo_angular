require 'spec_helper'

describe TodoObserver do

  before(:all) do
    @attr = { :modification => "Example", :event => 'Event' }
    @attr_todo = { :content => "Example", :done => :false }
  end

  describe 'after_create' do
    it "should add a log to the todo" do
      todo = Todo.new(@attr_todo)
      todo.should_receive(:add_log).with('creating')
      todo.save!
    end

    it "should create a new logdata" do
      todo = Todo.new(@attr_todo)
      expect {
        todo.save!
      }.to change {Logdata.count}.by(1)
    end

    it "check for right data" do
      todo = Todo.new(@attr_todo)
      expect {
        todo.save!
      }.to change {Logdata.count}.by(1)

      log = Logdata.first
      log.modification.should eq(todo.content)
      log.event.should eq('creating')
    end
  end

  describe 'after_update' do
    it "should create log about updating task" do
      todo = Todo.new(@attr_todo)
      todo.save!
      todo.update_attributes(:content => "Example", :done => :true)
      todo.should_receive(:add_log).with('updating')
      todo.save!

      log = Logdata.find(Logdata.first.id + 1)
      log.modification.should eq(todo.content)
      log.event.should eq('updating')
    end
  end

  describe 'after_destroy' do
    it "should create log about destroing task" do
      todo = Todo.create(@attr_todo)
      todo.should_receive(:add_log).with('destroing')
      todo.destroy
    end

    it "check creating a new logdata" do
      todo = Todo.create(@attr_todo)
      expect {
        todo.destroy
      }.to change {Logdata.count}.by(1)

      log = Logdata.find(Logdata.first.id + 1)
      log.modification.should eq(todo.content)
      log.event.should eq('destroing')
    end
  end
end
