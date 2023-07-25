class Blog < ApplicationRecord

    has_one_attached :image 

    def save_image(image_file)
        img_url = "#{SecureRandom.uuid}.#{image_file.content_type.split('/').last}"
        self.image.attach(io: image_file, filename: img_url)
        save 
        return img_url
    end 



end
