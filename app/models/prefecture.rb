class Prefecture < ApplicationRecord
  self.primary_key = "prefecture_id"
  has_many :shops
end
