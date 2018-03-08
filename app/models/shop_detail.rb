class ShopDetail < ApplicationRecord
  belongs_to :shop
  validates :shop_id, presence: true
end
