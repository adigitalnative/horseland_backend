FactoryBot.define do
  factory :transaction do
    player { FactoryBot.build_stubbed(:player) }
    amount_cents { 0 }
    description { "Test Description" }
  end
end
