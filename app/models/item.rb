class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_days

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true
  end
  with_options numericality: { other_than: 1 } do
    validates :category
    validates :condition
    validates :shipping_cost
    validates :prefecture
    validates :shipping_days
  end
end
