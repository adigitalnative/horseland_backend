class TransactionSerializer < ActiveModel::Serializer
  attributes :description, :timestamp, :amount, :withdrawal, :id

  def amount
    object.amount.format
  end

  def timestamp
    object.created_at.strftime("%B %-d, %Y")
  end
end
