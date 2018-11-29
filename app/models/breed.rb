class Breed < ApplicationRecord
  has_many :horses

  validates :name, presence: true
end
