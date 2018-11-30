class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :bank_balance, :available_horses 
  has_many :horses

  def bank_balance
    object.balance.format
  end
end
