FactoryBot.define do
  factory :horse do
    name { "MyString" }
    breed { FactoryBot.build_stubbed(:breed) }
    color { "MyString" }
    age { 0 }
    player { FactoryBot.build_stubbed(:player)}
    gender {"female"}
  end
end
