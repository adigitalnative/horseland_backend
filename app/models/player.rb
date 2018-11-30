class Player < ApplicationRecord

  has_many :horses
  has_many :transactions

  validates :email, presence: true

  monetize :balance_cents

  def available_horses
    Horse.where("for_sale = true AND player_id != #{self.id}")
  end

  def buy(horse)
    horse.update(player: self, for_sale: false)
  end

  def deposit(amount, description="Deposit into account")
    transaction = transactions.create(amount:amount, description: description)
    update(balance: balance + transaction.amount)
  end

  def withdraw(amount, description="Withdrawal from account")
    if balance > Money.new(amount)
      transaction = transactions.create(amount: amount, description: description)
      update(balance: balance - transaction.amount)
    else
      false
    end
  end

end
