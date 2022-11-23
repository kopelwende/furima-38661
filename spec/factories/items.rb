FactoryBot.define do
  factory :item do
    item_name   { Faker::Lorem.word }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    item_status_id { Faker::Number.between(from: 2, to: 7) }
    shipping_charges_id { Faker::Number.between(from: 2, to: 3) }
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    estimated_shipping_id { Faker::Number.between(from: 2, to: 4) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/583567194ca461ccc47b339bb7f8cac6.png'), filename: 'test_image.png')
    end
  end
end
