require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  let(:user_profile) { FactoryBot.build_stubbed(:user_profile) }
  it "is valid with valid inputs" do
    expect(user_profile).to be_valid
  end

  it "is invalid without a name" do
    user_profile.name = nil
    expect(user_profile).to_not be_valid
  end
end
