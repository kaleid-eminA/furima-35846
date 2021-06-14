FactoryBot.define do
  factory :order_destination do
    post_code     { '370-0534' }
    prefecture_id { 11 }
    city          { '邑楽郡大泉町丘山' }
    address       { '29-3' }
    building_name { '任意ですよ' }
    phone_number  { '08041217272' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
