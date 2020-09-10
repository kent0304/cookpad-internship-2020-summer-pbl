class Post < ApplicationRecord
    belongs_to :user
    belongs_to :image, dependent: :destroy, optional: true
    
    validates :name, presence: true, length: { maximum: 255 }
    validates :description, presence: true, length: { maximum: 512 } 
end
