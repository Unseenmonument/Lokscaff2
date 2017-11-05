class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :convo
	belongs_to :rume
	belongs_to :store
	belongs_to :rume
	
	has_many :comments
	
	serialize :upvote_com, Array
	serialize :downvote_com, Array

end
