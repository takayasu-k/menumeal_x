class Review < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  has_many :likes, dependent: :destroy  
  mount_uploader :picture, ImageUploader  
end
