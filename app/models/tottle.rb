class Tottle < ApplicationRecord

	belongs_to :user
	has_many :likes
	
	has_many comments, as: :commentable



end
