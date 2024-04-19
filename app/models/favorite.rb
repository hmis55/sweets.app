class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  #user_idとpost_idが重複しない状態に制限をかける
  validates :user_id, uniqueness: {scope: :post}
end
