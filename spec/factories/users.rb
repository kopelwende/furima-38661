FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name { 'なんで' }
    first_name { '全角使えへんの' }
    last_name_kana  { 'ナンデ' }
    first_name_kana { 'ニホンゴツカエナイノ' }
    birth_day { Faker::Date.birthday }
  end
end
