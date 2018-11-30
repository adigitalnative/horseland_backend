require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { FactoryBot.build_stubbed(:transaction)}

  it "is valid with valid inputs" do
    expect(transaction).to be_valid
  end

  it "is invalid without a player" do
    transaction.player_id = nil
    expect(transaction).to_not be_valid
  end
  it "is invalid without an amount" do
    transaction.amount_cents = nil
    expect(transaction).to_not be_valid
  end
  it "is invalid without a description" do
    transaction.description = nil
    expect(transaction).to_not be_valid
  end
end
