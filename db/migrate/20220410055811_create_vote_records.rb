class CreateVoteRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :vote_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vote, null: false, foreign_key: true
      t.string :vote_one
      t.string :vote_two
      t.string :status, :default => "start", :null => false

      t.timestamps
    end
  end
end