class User < ApplicationRecord
    has_many :posts,  dependent: :destroy
    has_many :oishisos, dependent: :destroy 
    has_many :tellmes,  dependent: :destroy
    has_many :oishiso_posts, through: :oishisos, source: :post 
    has_many :tellme_posts, through: :tellmes, source: :post 

    belongs_to :image

    validates :name, presence: true, length: { maximum: 255 } 
    validates :password_digest, presence: true, length: { maximum: 255 }
    validates :intro, length: { maximum: 512 }

    def already_oishisoed?(post)
        self.oishisos.exists?(post_id: post.id)
    end

    def already_tellmeed?(post)
        self.tellmes.exists?(post_id: post.id)
    end
end
