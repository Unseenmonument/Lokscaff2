class Convo < ApplicationRecord

	belongs_to :user
	belongs_to :rume
	
	has_many :comments, as: :commentable

	serialize :upvotes, Array
	serialize :downvotes, Array

end
