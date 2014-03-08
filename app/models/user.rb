class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :comments

 
  # using the model to define a custom twitter handle for the user
  def twitter_name
  	"@" + twitter_handle
  end

end
