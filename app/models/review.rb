class Review < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :picture, ImageUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
