module TweetsHelper

		# this will update the tweet resource to tell is how many comments each has
		def set_num_comments(posted_tweet_id)
			
			# To test that this helper method is working do
			puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
			puts "DEBUG CODE"
			puts "Hey this is coming from the set_num_comments helper method" 
			puts "tweet_id being passed = #{posted_tweet_id}"
			puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

			num_comments = Comment.where("tweet_id = #{posted_tweet_id}").count
			# select * from tweets where tweet_id = 12 (NB: where uses a key - value pair)

			puts "**********************************************"
			puts "DEBUG CODE"
			puts "Number of comments = " + num_comments.to_s
			puts "**********************************************"

			tweet = Tweet.find(posted_tweet_id)
			tweet.num_comments = num_comments
			tweet.save

			puts "***********SAVED***********"

		end



end
