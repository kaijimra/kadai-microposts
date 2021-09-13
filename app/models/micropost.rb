class Micropost < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 255 }

  has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'micropost_id'
  has_many :funs, through: :reverses_of_favorite, source: :user, dependent: :destroy
  has_many :favorites
end
