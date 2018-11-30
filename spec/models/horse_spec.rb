require 'rails_helper'

RSpec.describe Horse, type: :model do
  let(:horse) { FactoryBot.build_stubbed(:horse) }
  it "is valid with valid inputs" do
    expect(horse).to be_valid
  end

  it "is invalid without a name" do
    horse.name = nil
    expect(horse).to_not be_valid
  end

  it "is invalid without a gender" do
    horse.gender = nil
    expect(horse).to_not be_valid
  end

  it "is invalid without an age" do
    horse.age = nil
    expect(horse).to_not be_valid
  end

  it "has a breed" do
    expect(horse).to respond_to(:breed)
  end

  it "belongs to an player" do
    expect(horse).to respond_to(:player)
  end

  xit "can be set for_sale" do
    expect(horse).to respond_to(:for_sale?)
  end
end
