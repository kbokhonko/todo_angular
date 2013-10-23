class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :content
      t.integer :order
      t.boolean :done

      t.timestamps
    end
  end
end
