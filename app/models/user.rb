class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_one_attached :image
 
 has_many :post, dependent: :destroy
 has_many :post_comment, dependent: :destroy
 
 #バリデーション
  validates :name, presence: true
  validates :email, presence: true
  
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
end
