class Cheering < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  validates :user, presence: true
  validates :shop, presence: true
end
