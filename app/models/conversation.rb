class Conversation < ApplicationRecord
	
	belongs_to :user
	belongs_to :rume

	has_many :comments
	
	
	serialize :upvote, Array
	serialize :downvote, Array

end
