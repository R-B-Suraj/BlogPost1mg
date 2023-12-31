class Blog < ApplicationRecord

    has_one_attached :image 
    has_many :comments
    belongs_to :user

    validates :title, presence: true, length: {minimum: 1  , maximum: 60 }
    validates :desc, presence: true, length: {minimum:1, maximum:1000}
    
    def save_image(image_file)
        img_url = "#{SecureRandom.uuid}.#{image_file.content_type.split('/').last}"
        self.image.attach(io: image_file, filename: img_url)
        save 
        return img_url
    end 

    validates :image, size: { less_than: 1.megabyte, message: 'should be less than 1MB' }

  
  


end
