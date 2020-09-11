class Post < ApplicationRecord
    has_many :oishisos
    has_many :tellmes
    has_many :oishisoed_users, through: :oishisos, source: :user
    has_many :tellmeed_users, through: :tellmes, source: :user

    belongs_to :user
    belongs_to :image, dependent: :destroy, optional: true
    
    validates :name, presence: true, length: { maximum: 255 } 
end
