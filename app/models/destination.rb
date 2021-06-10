class Destination
  include ActiveModel::Model
  afte_accessor :user_id, :Product_id, :order_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number
    
  VALID_POST_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/

  with_options presence: true do
    validates :user_id
    validates :Product_id
    validates :post_code, { with: VALID_POST_CODE_REGEX }
    validates :city
    validates :address
    validates :phone_number, { with: VALID_PHONE_NUMBER_REGEX }
    validates :prefecture_id, numericality: { other_than: 1 }
  end


  def save
    order = Order.create(user_id: user_id, Product_id: prefecture_id)

    Destination.create(post_code: post_code, city: city, address: address, building_name: building_name
                   phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)
  end
end