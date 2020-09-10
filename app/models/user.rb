class User < ApplicationRecord
    has_many :posts,  dependent: :destroy

    validates :name, presence: true, length: { maximum: 255 } 
    validates :password_digest, presence: true, length: { maximum: 255 }
end
