class Review < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  mount_uploader :picture, ImageUploader  
end
