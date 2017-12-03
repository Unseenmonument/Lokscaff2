class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tottles
  has_many :rumes
  has_many :convos
  has_many :comments, as: :commentable
  has_many :stores
  has_many :products

  serialize :following, Array
  serialize :listen_to, Array
  
  serialize :downvotes, Array
  serialize :upvotes, Array
  
  serialize :downvote_com, Array
  serialize :upvote_com, Array

end
