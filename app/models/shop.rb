class Shop < ApplicationRecord
  has_many :menus
  has_one :shop_detail
  mount_uploader :prof_picture, ImageUploader
end
