class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :order
  has_one_attached :image

  VALID_PRICE_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :shipping_cost_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :days_to_ship_id, numericality: { other_than: 1 }
    validates :price, format: { with: VALID_PRICE_REGEX },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 99_999_999 }
  end
end
