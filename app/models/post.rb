class Post < ApplicationRecord
    belongs_to :user
    belongs_to :image, dependent: :destroy
    
    validates :name, presence: true, length: { maximum: 255 }
    validates :image, presence: true 
    validates :description, presence: true, length: { maximum: 512 } 
end
