class Comment < ApplicationRecord

	belongs_to :commentable, polymorphic: true

	belongs_to :user

	serialize :upvote_com, Array
	serialize :downvote_com, Array

end
