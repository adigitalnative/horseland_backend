FactoryBot.define do
  factory :player do
    name { "MyString" }
    email { Faker::Internet.email }
    password { "password" }
  end
end
