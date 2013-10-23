class Logdata < ActiveRecord::Base
  attr_accessible :modification, :event

  def self.start_logging(content, event)
    Logdata.create!(:modification => content, :event => event)
  end
end
