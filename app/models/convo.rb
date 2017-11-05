class Convo < ApplicationRecord

	belongs_to :user
	belongs_to :rume
	
	has_many :comments

	serialize :upvotes, Array
	serialize :downvotes, Array

end
