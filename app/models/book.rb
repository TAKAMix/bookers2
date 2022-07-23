class Book < ApplicationRecord
   belongs_to :user
   has_one_attached :image
   has_many :favorites, dependent: :destroy
   has_many :post_comments, dependent: :destroy
   
  #バリデーションの実装
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
