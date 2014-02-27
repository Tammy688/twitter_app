class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comments, limit: 350
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end
