class Player < ApplicationRecord

  has_many :horses
  has_many :transactions

  validates :email, presence: true

  monetize :balance_cents

  after_create :initial_deposit

  def buy(horse)
    transfer(horse.player, horse.sale_price, "Purchase of #{horse.name}", "Sale of #{horse.name}")
    horse.update(player: self, for_sale: false)
  end

  def deposit(amount, description="Deposit into account")
    transaction = transactions.create(amount:amount, description: description)
    update(balance: balance + transaction.amount)
  end

  def withdraw(amount, description="Withdrawal from account")
    if balance > Money.new(amount)
      transaction = transactions.create(amount: amount, description: description, withdrawal: true)
      update(balance: balance - transaction.amount)
      true
    else
      false
    end
  end

  def transfer(player_two, amount, withdrawal_desc="Transfer to ${player_two.name}", deposit_desc="Transfer from ${player_one.name}")
    if self.withdraw(amount, withdrawal_desc)
      player_two.deposit(amount, deposit_desc)
      true
    else
      false
    end
  end

  private

  def initial_deposit
    deposit(10000, "Initial deposit")
  end
end
