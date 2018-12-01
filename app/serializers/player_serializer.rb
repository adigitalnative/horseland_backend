class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :bank_balance, :available_horses
  has_many :horses
  has_many :transactions

  def bank_balance
    object.balance.format
  end

  def transactions
    object.transactions.order("created_at").reverse
  end

  def available_horses
    Horse.where("for_sale = true AND player_id != #{object.id}")
  end
end
