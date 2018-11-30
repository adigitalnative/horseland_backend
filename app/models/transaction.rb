class Transaction < ApplicationRecord
  belongs_to :player

  validates :amount_cents, presence: true
  validates :description, presence: true

  monetize :amount_cents
end
