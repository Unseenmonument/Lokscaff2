class Room < ApplicationRecord

	
	belongs_to :user
	has_many :conversations

	serialize :listeners, Array



end
