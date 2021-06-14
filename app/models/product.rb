class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :shipping_cost
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one :order
  has_one_attached :image

  VALID_PRICE_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
    validates :price, format: { with: VALID_PRICE_REGEX },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
