class Room < ApplicationRecord

	
	belongs_to :user
	has_many :conversations



end
