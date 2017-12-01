class Product < ApplicationRecord
    
    belongs_to :user
    belongs_to :store_params
    
    has_many :comments, as: :commentable
    
end
