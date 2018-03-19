class Shop < ApplicationRecord
  has_many :menus
  has_many :cheerings, class_name: "Cheering",
                      foreign_key: "shop_id",
                      dependent: :destroy
  has_one :shop_detail
  mount_uploader :prof_picture, ImageUploader
  validates :name, presence: true;
  validates :address, presence: true;
end
