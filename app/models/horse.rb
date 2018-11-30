class Horse < ApplicationRecord
  belongs_to :breed
  belongs_to :player

  validates :name, presence: true
  validates :age, presence: true, numericality: {only_integer: true}
  validates :gender, presence: true, inclusion: { in: ["male", "female", "gelding"]}

  def breed_name
    breed.name
  end
end
