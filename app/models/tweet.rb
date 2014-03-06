class Tweet < ActiveRecord::Base
	 validates_length_of :tweets, :maximum => 350, :message => "Tweet exceeded limit of 350!"

	 belongs_to :user
	 has_many :comments
end
