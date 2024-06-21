class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users, source: :user
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end

  validates :name, presence: true
  validates :introduction, presence: true
  
  has_one_attached :group_image

end
