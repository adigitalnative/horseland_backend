FactoryBot.define do
  factory :horse do
    name { Faker::Ancient.hero }
    breed { FactoryBot.build_stubbed(:breed) }
    color { "Brown" }
    age { rand(0..20) }
    player { FactoryBot.build_stubbed(:player)}
    gender {"female"}
  end
end
