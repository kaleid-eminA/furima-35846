class Destination
  include ActiveModel::Model
  afte_accessor :order_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number
    
  VALID_POST_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/

  with_options presence: true do
    validates :post_code, { with: VALID_POST_CODE_REGEX }
    validates :city
    validates :address
    validates :phone_number, { with: VALID_PHONE_NUMBER_REGEX }
  end
    validates :prefecture_id, numericality: { other_than: 1 }

  def save
    user = User.create(email: email, nickname: nickname, family_name: family_name, 
                       first_name: first_name, family_name_kana: family_name_kana, 
                       first_name_kana: first_name_kana, birth_date: birth_date)

    Address.create(post_code: post_code, city: city, address: address, building_name: building_name
                   phone_number: phone_number, prefecture_id: prefecture_id)
  end
end