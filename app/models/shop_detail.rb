class ShopDetail < ApplicationRecord
  belongs_to :shop
  validates :shop_id, presence: true
  validates :access, length: { maximum: 400 }
end
