class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :post, dependent: :destroy
 has_many :post_comment, dependent: :destroy
 
 #バリデーション
  validates :name, presence: true
  validates :email, presence: true
end
