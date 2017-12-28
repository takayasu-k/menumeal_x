class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy
  has_many :reviews
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :menus
  has_many :eaten_menus, class_name: "EatenMenu",
                               foreign_key: "user_id",
                               dependent: :destroy
  has_many :desired_menus, class_name: "DesiredMenu",
                                 foreign_key: "user_id",
                                 dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_create :init_user_profile
  mount_uploader :prof_picture, ImageUploader

  # 空のユーザープロフィールを作成する
  def init_user_profile
    self.create_user_profile!
  end

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしていたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  # 現在のユーザーが食べたメニューに登録していたらtrueを返す
  def registering_eaten_menu?(menu)
    eaten_menus.include?(menu)
  end

  # 現在のユーザーが食べたいメニューに登録していたらtrueを返す
  def registering_desired_menu?(menu)
    desired_menus.include?(menu)
  end

  # 現在のユーザーがいいねしていたらtrueを返す
  def like?(review)
    likes.include?(review)
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
