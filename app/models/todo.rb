class Todo < ActiveRecord::Base
  attr_accessible :content, :done, :order

  validates :content, :presence => true,
  			:length => {:minimum => 1}

  def add_log(event)
  	Logdata.start_logging(self.content, event)
  end
end
