FactoryBot.define do
  factory :product do
    image { Faker::Lorem.sentence }
    name { '商品の名前' }
    description { '商品の説明' }
    condition_id { ' 3 '}
    shipping_costs_id { '3' }
    prefecture_id { '4' }
    days_to_ships_id { '2' }
    categories_id { '5' }
    price { '10000' }

    user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/LOOPERS.png'), filename: 'LOOPERS.png')
    end

  end
end
