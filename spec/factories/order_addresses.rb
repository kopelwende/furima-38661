FactoryBot.define do
  factory :order_address do
    user_id{association :user}
    item_id{association :item}
    
    post_code {"123-4567"}
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Faker::Address.city }
    address { Faker::Address.zip_code }
    building { Faker::Lorem.sentence }
    phone_number {12345678900}
  end
end
