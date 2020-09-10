class PostForm
    include ActiveModel::Validations

    attr_accessor :name, :description, :image
    attr_reader :post 

    validates :name, presence: true, length: { maximum: 255 }
    validates :description, presence: true, length: { maximum: 512 } 
    validate :validate_image

    def initialize(post)
        @post = post 
        # 必要な情報を渡す
        @name = post.name 
        @description = post.description 
        @image_id = post.image_id 
    end 

    def apply(params)
        @name = params[:name]
        @description = params[:description]
    
        @image_upload = true
        @image_body = params[:image].read 
        @image_filename = params[:image].original_filename
    end 

    def save
        return false unless valid?

        @post.name = @name 
        @post.description = @description 

        image = Image.create!(body: @image_body, filename: @image_filename)
        @post.image_id = image.id 
        @post.save! 
        return true
    end 

    def persisted?
        @post.persisted?
    end 

    private def trim_image_filename(name)
        name_len = name.size
        return name if name_len < MAXIMUM_FILENAME_SIZE
        start_offset = name_len - MAXIMUM_FILENAME_SIZE
        name[start_offset..]
    end

    private def validate_image
        if @image_uploaded && @image_body.size > Image::MAXIMUM_FILENAME_SIZE
            errors.add(:image, "can't be larger than #{number_to_human_size(Image::MAXIMUM_FILE_SIZE)}.")
        end
    end

        
end 