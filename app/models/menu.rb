class Menu < ApplicationRecord
  enum status: { available:0, sold_out:1, end_of_sale:2 }
  enum menu_type: { food:0, drink:1, course:2, others:9 }
  belongs_to :shop
  has_many :reviews
  has_many :users
  has_many :eaten_menus, class_name: "EatenMenu",
                        foreign_key: "menu_id",
                        dependent: :destroy
  has_many :desired_menus, class_name: "DesiredMenu",
                          foreign_key: "menu_id",
                          dependent: :destroy
  validates :shop_id, presence: true
  validates :name, presence: true,
                    length: { maximum: 90 }
  validates :menu_type, presence: true
  mount_uploader :prof_picture, ImageUploader
end
