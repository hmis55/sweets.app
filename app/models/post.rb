class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #いいね機能
  def favorited_by?(user)
   user.present? && favorites.exists?(user_id: user.id)
  end

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true

  #検索機能
  def self.search_for(content, method)
    case method
      when 'perfect'
        Post.where(title: content)
      when 'forward'
        Post.where('title LIKE ?', "#{content}%")
      when 'backward'
        Post.where('title LIKE ?', "%#{content}")
      else
        Post.where('title LIKE ?', "%#{content}%")
    end
  end
  
  #投稿順
  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }
end
