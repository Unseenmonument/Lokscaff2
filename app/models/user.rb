class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tottles
  has_many :rumes
  has_many :convos
  has_many :comments

	has_many :conversations
	has_many :rooms

  serialize :following, Array
  serialize :listen_to, Array

  

end
