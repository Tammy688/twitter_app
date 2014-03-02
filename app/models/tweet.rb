class Tweet < ActiveRecord::Base
	 validates_length_of :tweets, :maximum => 10, :message => "Too long dude!"
end
