class Review < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :picture, ImageUploader
  validates :user_id, presence: true
  validates :menu_id, presence: true
  validates :content, length: { maximum: 800 }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  class << self
    def search_by_menu(menu_id)
      left_outer_joins(:user)
        .select('reviews.id as review_id, users.name as user_name, reviews.content, reviews.updated_at')
        .where(menu_id: menu_id)
        .order(id: :desc)
    end
  end
end
