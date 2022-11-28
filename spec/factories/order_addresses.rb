FactoryBot.define do
  factory :order_address do
    association :user
    association :item
    
    post_code {123-4567}
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Faker::Address.city }
    address { Faker::Address.zip_code }
    bilding { Faker::Lorem.characters }
    phone_number { Faker::Number.between(from: 10, to: 11)}
  end
end
