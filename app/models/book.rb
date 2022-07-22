class Book < ApplicationRecord
   belongs_to :user
   has_one_attached :image
   
　#バリデーションの実装
  validates :title, presence: true
  validates :body, presence: true
end
