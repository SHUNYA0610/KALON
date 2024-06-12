class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :view_counts, dependent: :destroy
  validates :category, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_image
    # unless image.attached?
    #   file_path = Rails.root.join('app/assets/images/no-image.jpg')
    #   image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    # end

    #image.variant(resize_to_limit: [100, 100]).processed
    image.variant(gravity: :center, resize:"640x640^", crop:"640x640+0+0").processed
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(caption: content)
    elsif method == 'forward'
      Post.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Post.where('name LIKE ?', '%' + content)
    else
      Post.where('name LIKE ?', '%' + content + '%')
    end
  end

end
