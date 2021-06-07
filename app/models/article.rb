class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categorise
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_cost

  validates :categorises_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }  
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :shipping_cost_id, numericality: { other_than: 1 } 
end
