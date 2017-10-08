class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy  
  after_create :init_user_profile
  mount_uploader :prof_picture, ImageUploader

  def init_user_profile
    self.create_user_profile!
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
