class UserUpdateForm
    include ActiveModel::Validations
  
    attr_accessor :name, :intro, :password, :image
  
    validates :name, presence: true, length: { maximum: 255 }
    validates :intro, length: { maximum: 512 }
    validates :password, presence: true, length: { maximum: 255 }, confirmation: true, on: :with_password_change
    validates :password_confirmation, presence: true, on: :with_password_change
  
    def initialize(user)
      @user = user
      @name = user.name
      @intro = user.intro
      @image_id = user.image_id
      @image_upload = false
    end
  
    def save
      return false unless valid?
  
      @user.name = @name
      if @password.present?
        @user.password_digest = DigestGenerator.digest(@password)
      end
      image = Image.create!(body: @image_body, filename: @image_filename)
        @user.image_id = image.id 
      @user.save!
  
      return true
    end
  
    def apply(params)
      @name = params[:name]
      @intro = params[:intro]
      @password = params[:password]
      @password_confirmation = params[:password_confirmation]
      if params[:image].present?
        @image_upload = true 
        @image_body = params[:image].read
        @image_filename = params[:image].original_filename
      end
    end
  
    def persisted?
      true
    end
  
    def valid?
      if @password.present?
        validate(:with_password_change)
      else
        validate
      end
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