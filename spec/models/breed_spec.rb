require 'rails_helper'

RSpec.describe Breed, type: :model do
  let(:breed) { FactoryBot.build_stubbed(:breed)}

  it "is valid with valid attributes" do
    expect(breed).to be_valid
  end

  it "is invalid without a name" do
    breed.name = nil
    expect(breed).to_not be_valid
  end

  it "has many horses" do
    expect(breed).to respond_to(:horses)
  end
end
