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

  context "#available_horses" do
    it "returns an empty array if there are no horses for sale" do
      expect(player.available_horses).to eq([])
    end

    it "returns an array of horses for sale" do
      horse_for_sale_one = FactoryBot.build_stubbed(:horse, for_sale: true)
      horse_for_sale_two = FactoryBot.build_stubbed(:horse, for_sale: true)
      horse_for_sale_three = FactoryBot.build_stubbed(:horse, for_sale: true)

      expect(player.available_horses).to include(horse_for_sale_one)
      expect(player.available_horses).to include(horse_for_sale_two)
      expect(player.available_horses).to include(horse_for_sale_three)
    end

    it "does not include the players' own horses" do
      horse_for_sale_one = FactoryBot.build_stubbed(:horse, for_sale: true, player: player)
      horse_for_sale_two = FactoryBot.build_stubbed(:horse, for_sale: true, player: FactoryBot.build_stubbed(:player))

      expect(player.available_horses).to_not include(horse_for_sale_one)
    end
  end
end
