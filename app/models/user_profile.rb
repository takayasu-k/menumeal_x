class UserProfile < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    validates :profile, length: { maximum: 400 } 
end
