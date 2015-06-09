class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, :description, :price, presence: true
  validates :price, format: { with: /\A[0-9]{1,}\.\d{1,2}\Z/ }

  def average_rating
    reviews.average(:rating).round(2)
  end
end
