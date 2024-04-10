class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :post_comment, dependent: :destroy
end
