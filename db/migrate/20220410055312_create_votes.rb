class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.string :name, :null => false
      t.string :type, :null => false
      t.datetime :start_time
      t.datetime :end_time, :null => false

      t.timestamps
    end
  end
end
