class User < ApplicationRecord
  has_many :horses
  
  validates :email, presence: true
end
