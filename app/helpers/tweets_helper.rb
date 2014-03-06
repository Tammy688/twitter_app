module TweetsHelper

		# this will update the tweet resource to tell is how many comments each has
		def set_num_comments(tweet_id)
			# To test that this helper method is working do
			puts "Hey this is coming from the set_num_comments helper method" 

			# To calculate the number of comments each tweet has do
			@tweet.tweet_id.count #check and make sure this works


		end
end
