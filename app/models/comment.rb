class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :convo
	belongs_to :rume

	

end
