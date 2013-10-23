class AddEventToLogdata < ActiveRecord::Migration
  def change
    add_column :logdata, :event, :string
  end
end
