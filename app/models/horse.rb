class Horse < ApplicationRecord
  belongs_to :breed
  belongs_to :user

  validates :name, presence: true
  validates :age, presence: true, numericality: {only_integer: true}
end
