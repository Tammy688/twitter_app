class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweets, limit: 350
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
