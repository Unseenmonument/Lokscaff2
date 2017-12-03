class Product < ApplicationRecord
    
    mount_uploader :image, ImageUploader
    
    belongs_to :user
    belongs_to :store
    
    has_many :comments, as: :commentable
    
end
