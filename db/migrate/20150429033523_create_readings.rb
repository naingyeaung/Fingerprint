class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
    	t.string :name
    	t.datetime :time
    	t.timestamps
    end
    say "Create a table"
  end
end
