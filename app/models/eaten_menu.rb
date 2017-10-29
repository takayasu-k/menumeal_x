class EatenMenu < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  validates :user, presense: true
  validates :menu, presense: true
end
