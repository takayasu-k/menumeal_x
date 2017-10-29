class DesiredMenu < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  validates :user, presence: true
  validates :menu, presence: true
end
