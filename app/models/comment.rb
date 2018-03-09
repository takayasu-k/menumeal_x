class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :content, presence: true,
                      lenth: { maximum: 400 }
end
