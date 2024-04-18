class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :post_comment, dependent: :destroy

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true

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
end
