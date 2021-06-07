class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categories
  belongs_to :condition
  belongs_to :days_to_ships
  belongs_to :prefecture
  belongs_to :shipping_costs

  validates :categories_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 }
  validates :days_to_ships_id, numericality: { other_than: 1 }  
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :shipping_costs_id, numericality: { other_than: 1 } 
end
