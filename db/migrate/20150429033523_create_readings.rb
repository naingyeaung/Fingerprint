class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
    	t.integer :user_id
    	t.string :name
    	t.datetime :time
    	t.timestamps
    end
    say "Create a table"
  end
end
