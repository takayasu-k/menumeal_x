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

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  # 現在のメニューが食べたメニューに登録されていたらtrueを返す
  def registering_eaten_menu?(menu)
    eaten_menus.include?(menu)
  end

  # 現在のメニューが食べたいメニューに登録されていたらtrueを返す
  def registering_desired_menu?(menu)
    desired_menus.include?(menu)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
