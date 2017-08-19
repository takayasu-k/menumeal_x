class Menu < ApplicationRecord
  enum status: { available:0, sold_out:1, end_of_sale:2 }
  enum menu_type: { food:0, drink:1, others:2 }
  belongs_to :shop
end
