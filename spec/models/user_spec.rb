require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build_stubbed(:user) }

  it "is valid with valid inputs" do
    expect(user).to be_valid
  end
  it "is invalid without an email" do
    user.email = nil
    expect(user).to_not be_valid
  end

  it "can have many horses" do
    expect(user).to respond_to(:horses)
  end
end
