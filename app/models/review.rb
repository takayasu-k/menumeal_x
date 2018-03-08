class Review < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :picture, ImageUploader
  validates :user_id, presence: true;
  validates :menu_id, presence: true;

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
