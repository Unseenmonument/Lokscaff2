 class Rume < ApplicationRecord

	belongs_to :user
	has_many :convos
	has_many :comments

	has_many :conversations
	serialize :listeners, Array

	
end
