FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    sequence(:email) { Faker::Internet.email }
    password { "123123" }
    password_confirmation { "123123" }
    phone { Faker::PhoneNumber.subscriber_number(length: 10) }
    address { Faker::Address.city }
  end
end
