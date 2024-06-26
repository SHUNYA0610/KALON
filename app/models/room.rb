class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :users, through: :entries, source: :user
  validates :messages, length: { minimum: 1, maximum: 200 }
end
