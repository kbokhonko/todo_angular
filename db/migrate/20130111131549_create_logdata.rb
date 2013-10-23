class CreateLogdata < ActiveRecord::Migration
  def change
    create_table :logdata do |t|
      t.string :modification

      t.timestamps
    end
  end
end
