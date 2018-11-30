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

    xit "returns an array of horses for sale" do
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

  context "#buy(horse)" do
    let(:first_player) { FactoryBot.create(:player) }
    let(:breed) { FactoryBot.create(:breed)}
    let(:horse) { FactoryBot.create(:horse, for_sale: true, player: player, breed: breed)}
    let(:second_player) {FactoryBot.create(:player) }

    xit "fails if the player already owns the horse" do
      # expect(player.buy(horse)).to raise_error
    end

    xit "fails if the horse is not for sale" do
      horse.update(for_sale: false)
    end

    context "when the player can purchase the horse" do
      before do
        @horse = FactoryBot.create(:horse, for_sale: true, player: FactoryBot.create(:player), breed: breed)
        first_player.buy(@horse)
      end

      it "sets the horse's player to the new owner" do
        expect(@horse.player).to eq(first_player)
      end
    end

  end

  context "#withdraw(amount, [description])" do
    let(:player) { FactoryBot.create(:player) }

    context "when the player has enough cash" do
      before do
        player.deposit(5000, "Starter cash")
        player.withdraw(100, "Buyin' stuff")
      end

      it "deducts the amount from the player's total" do
        expect(player.balance_cents).to eq(1490000)
      end

      it "sets the descriptiion when provided" do
        expect(player.transactions.last.description).to eq("Buyin' stuff")
      end

      it "has a good default for description" do
        player.withdraw(200)
        expect(player.transactions.last.description).to eq("Withdrawal from account")
      end
    end

    context "when the player does not have enough cash" do
      before do
        player.update(balance_cents: 0)
        player.withdraw(100, "Overdrawn")
      end

      it "does not deduct the amount" do
        expect(player.balance_cents).to eq(0)
      end

      it "does not create the transaction" do
        expect(player.transactions.last.description).to_not eq("Overdrawn")
      end

      it "returns false" do
        expect(player.withdraw(300)).to eq(false)
      end
    end
  end

  context "#deposit(amount, [description])" do
    let(:player) { FactoryBot.create(:player) }

    it "adds the amount to the player's total" do
      old_balance = player.balance_cents
      player.deposit(100)
      expect(player.balance_cents).to eq(old_balance + 10000)
    end

    it "adds a default description if none is provided" do
      player.deposit(100)
      expect(player.transactions.last.description).to eq("Deposit into account")
    end

    it "uses the provided desc if there is one" do
      player.deposit(100, "Buying a horse")
      expect(player.transactions.last.description).to eq("Buying a horse")
    end
  end

  context "#transfer" do
    let(:player_one) { FactoryBot.create(:player) }
    let(:player_two) { FactoryBot.create(:player) }
    context "when first user has enough money" do
      before do
        player_one.deposit(10000)
        @player_one_balance = player_one.balance_cents
        @player_two_balance = player_two.balance_cents
        player_one.transfer(player_two, 500, "Sale of horse", "purchase of horse")
      end

      context "the first user" do
        it "withdraws the correct amount" do
          expect(player_one.balance_cents).to eq(@player_one_balance - 500*100)
        end
      end

      context "the second user" do
        it "deposits the correct amount" do
          expect(player_two.balance_cents).to eq(@player_two_balance + 500*100)
        end
        it "has a good default for the transaction description"
      end
    end
    context "when the initiator does not have enough money" do
      it "does not transfer the funds"
    end
  end

  context ".create" do
    it "sets up an inital $10000 deposit into the user's account" do
      player = FactoryBot.create(:player)
      expect(player.balance_cents).to eq(10000*100)
      expect(player.transactions.count).to eq(1)
    end
  end
end
