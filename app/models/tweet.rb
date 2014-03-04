class Tweet < ActiveRecord::Base
	 validates_length_of :tweets, :maximum => 350, :message => "Tweet exceeded limit of 350!"

	 has_many :comments
end
