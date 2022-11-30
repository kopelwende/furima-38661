FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Faker::Address.city }
    address { Faker::Address.zip_code }
    building { Faker::Lorem.sentence }
    phone_number { 12_345_678_900 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
