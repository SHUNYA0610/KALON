class Banner < ApplicationRecord
  has_one_attached :banner_image
  
  def get_banner_image()
    unless banner_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      banner_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    banner_image
  end
end
