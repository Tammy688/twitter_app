class AddNumcommentsToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :num_comments, :integer
  end
end
