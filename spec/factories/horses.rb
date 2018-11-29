FactoryBot.define do
  factory :horse do
    name { "MyString" }
    breed { FactoryBot.build_stubbed(:breed) }
    color { "MyString" }
    age { 0 }
    user { FactoryBot.build_stubbed(:user)}
  end
end
