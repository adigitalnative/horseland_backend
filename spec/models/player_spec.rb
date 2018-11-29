require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { FactoryBot.build_stubbed(:player) }

  it "is valid with valid inputs" do
    expect(player).to be_valid
  end

  it "is invalid without an email" do
    player.email = nil
    expect(player).to_not be_valid
  end

  it "can have horses" do
    expect(player).to respond_to(:horses)
  end
end
