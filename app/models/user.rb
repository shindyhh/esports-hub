class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_many :posts
  has_many :followers, foreign_key: "followed_id", class_name: "Follow"
  has_many :following, foreign_key: "follower_id", class_name: "Follow"
  has_many :comments
  has_many :chatrooms
  has_many :memberships
  has_many :teams, through: :memberships
  has_one_attached :avatar
  acts_as_taggable_on :tags
  validates :tag_list, presence: true

  TAGS = ['League of Legends', 'Counter-Strike', 'Tekken 7']


  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "40x40!").processed
    else
     "placeholder.png"
    end
  end
end
