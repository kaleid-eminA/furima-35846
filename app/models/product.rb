class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image

  VALID_PRICE_REGEX = /\A[0-9]+\z/

  with_options presence: true do
  validates :name
  validates :description
  validates :categories_id
  validates :condition_id
  validates :shipping_cost_id
  validates :prefecture_id
  validates :days_to_ship_id
  validates :price, format: { with: VALID_PRICE_REGEX }
  end
end
