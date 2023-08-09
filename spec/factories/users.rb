FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name   { 'やマ田' }
    first_name  { '太ろウ' }
    last_name_kana  { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_day { Faker::Date.between(from: '1930-01-01', to: '2022-12-31') }
  end
end
