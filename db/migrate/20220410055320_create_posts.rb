class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vote, null: false, foreign_key: true
      t.text :content, null: false
      t.string :vote_two, null: false

      t.timestamps
    end
  end
end
