class Conversation < ApplicationRecord
	
	belongs_to :user
	belongs_to :rume

	has_many :comments

end
