class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_one_attached :image

 #フォロー機能関連付け
 has_many :post, dependent: :destroy
 has_many :post_comment, dependent: :destroy
 has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
 has_many :followings, through: :active_relationships, source: :followed
 has_many :followers, through: :passive_relationships, source: :follower


 has_many :favorites, dependent: :destroy

 #DM機能の関連付け
 has_many :user_rooms, dependent: :destroy
 has_many :chats, dependent: :destroy
 has_many :rooms, through: :user_rooms

 #バリデーション
  validates :name, presence: true
  validates :email, presence: true


#ゲストログイン
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

#検索機能
  def self.search_for(content, method)
    case method
      when 'perfect'
        User.where(name: content)
      when 'forward'
        User.where('name LIKE ?', "#{content}%")
      when 'backward'
        User.where('name LIKE ?', "%#{content}")
      else
        User.where('name LIKE ?', "%#{content}%")
    end
  end

  #フォローフォロワー機能
  # 指定したユーザーをフォローする
  def follow(user)
    active_relationships.create(followed_id: user.id)
  end
  # 指定したユーザーのフォローを解除する
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  # 指定したユーザーをフォローしているかどうかを判定
  def following?(user)
    followings.include?(user)
  end
end
