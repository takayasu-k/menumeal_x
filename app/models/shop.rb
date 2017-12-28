class Shop < ApplicationRecord
  has_many :menus
  has_one :shop_detail
end
